import 'dart:developer';
import 'dart:io';

import 'package:demo_social_app/api_services/base_api.dart';
import 'package:demo_social_app/data_models/user.dart';
import 'package:demo_social_app/utils/app_auth_helper.dart';
import 'package:demo_social_app/utils/shared_preference_helper.dart';
import 'package:demo_social_app/utils/snackbar_helper.dart';
import 'package:demo_social_app/widgets/photo_chooser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserController extends GetxController with StateMixin<UserData> {
  bool uploadingDp = false;
  @override
  void onInit() {
    super.onInit();

    final user = SharedPreferenceHelper.user?.user;
    change(user, status: user == null ? RxStatus.empty() : RxStatus.success());
  }

  updateUser(UserData? user) {
    final u = SharedPreferenceHelper.user;
    if (u != null) {
      u.user = user;
      SharedPreferenceHelper.storeUser(user: u);
    }
    change(null, status: RxStatus.loading());
    change(user, status: RxStatus.success());
  }

  chooseProfilePicture() async {
    Get.focusScope?.unfocus();
    Get.bottomSheet(const PhotoChooser(), backgroundColor: Colors.white)
        .then((value) {
      if (value != null && value is File) {
        uploadDp(value);
      }
    });
  }
  uploadDp(File image) async {
    uploadingDp = true;
    change(state, status: RxStatus.success());
    try {
      String? url = await ApiCall.singleFileUpload(image);
      if (url != null) await AuthHelper.updateUser({"avatar": url});
      change(state, status: RxStatus.success());
    } catch (e, s) {
      log("profile", error: e, stackTrace: s);
      SnackBarHelper.show(e.toString());
    } finally {
      uploadingDp = false;
      change(state, status: RxStatus.success());
    }
  }

  // refreshUser() async {
  //   if (SharedPreferenceHelper.user == null) return;
  //   try {
  //     change(null, status: RxStatus.loading());
  //
  //     final result = await ApiCall.get("users",
  //         id: SharedPreferenceHelper.user!.user!.id!,
  //         query: {"\$populate": "userDetails"});
  //     final updatedData = UserData.fromJson(result.data);
  //     // updateUser(updatedData);
  //     change(updatedData, status: RxStatus.success());
  //   } catch (e, s) {
  //     SnackBarHelper.show(e.toString());
  //     log("refreshUser", error: e, stackTrace: s);
  //   }
  // }
}
