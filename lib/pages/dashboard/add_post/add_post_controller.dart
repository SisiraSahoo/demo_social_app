import 'dart:developer';

import 'package:demo_social_app/api_services/base_api.dart';
import 'package:demo_social_app/utils/snackbar_helper.dart';
import 'package:demo_social_app/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController{
  String? caption;
  String? attachment;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<AppPrimaryButtonState> buttonKey =
  GlobalKey<AppPrimaryButtonState>();
  late Rx<AutovalidateMode> autoValidateMode;

  @override
  void onInit() {
    super.onInit();
    autoValidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    autoValidateMode.close();
    super.dispose();
  }

  void capSaved(String? newValue) {
    caption = newValue!;
  }
  void attachSaved(String? newValue) {
    attachment = newValue!;
  }




  Future<void> createPost() async {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      try{
        final result = await ApiCall.post(
          "post",
          body: {"caption": caption},
        );
        log('email result ${result.data}');
      }catch(e){
        SnackBarHelper.show(e.toString());
        log("createPost",error: e);
      }
    }

  }

}