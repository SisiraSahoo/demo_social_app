import 'dart:developer';

import 'package:demo_social_app/api_services/base_api.dart';
import 'package:demo_social_app/data_models/post.dart';
import 'package:demo_social_app/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with StateMixin<List<PostDatum>> {
  int limit = 20, skip = 0;
  bool shouldLoadMore = true;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getPosts();
    scrollController.addListener(() {
      final maxGeneralScroll = scrollController.position.maxScrollExtent;
      final currentGeneralScroll = scrollController.position.pixels;
      if (maxGeneralScroll <= currentGeneralScroll) {
        getMorePosts();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void getPosts() async {
    skip = 0;
    shouldLoadMore = true;
    try {
      change(null, status: RxStatus.loading());
      final result = await ApiCall.get('post',
          isAuthNeeded: SharedPreferenceHelper.user != null,
          query: {
            '\$skip': skip,
            '\$limit': limit,
            '\$sort[createdAt]': -1,
            '\$populate': 'createdBy'
          });
      print('result:- ${result.data}');
      final response = PostResponse.fromJson(result.data);
      print('success:- ${response.toString()}');
      if (response.data!.length < limit) {
        shouldLoadMore = false;
      }
      change(response.data,
          status:
              response.data!.isEmpty ? RxStatus.empty() : RxStatus.success());
    } catch (e, s) {
      log("message", error: e, stackTrace: s);
      change(null, status: RxStatus.error(e.toString()));

    }
  }

  void getMorePosts() async {
    if (shouldLoadMore && !status.isLoadingMore) {
      try {
        skip = state!.length;
        change(state, status: RxStatus.loadingMore());
        final result = await ApiCall.get('post',
            isAuthNeeded: SharedPreferenceHelper.user != null,
            query: {'\$limit': limit, '\$skip': skip, '\$sort[createdAt]': -1});
        final response = PostResponse.fromJson(result.data);
        if (response.data!.length < limit) {
          shouldLoadMore = false;
        }
        change((state ?? []) + response.data!, status: RxStatus.success());
      } catch (e) {
        change(state, status: RxStatus.success());
      }
    }
  }
  getLikePost() async {
    try{
      final result = await ApiCall.post('like',
          body: {
        for(int i = 0 ; i<state!.length; i++){
            "post": state![i].id
        }
          }
      );
      final response = PostDatum.fromJson(result.data);
// change(response,status: RxStatus.success());
    }catch(e){
      log('likepost ',error: e);
    }
  }

}
