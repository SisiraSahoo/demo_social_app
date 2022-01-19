import 'dart:developer';

import 'package:demo_social_app/pages/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_social_app/utils/app_auth_helper.dart';
import 'package:demo_social_app/utils/snackbar_helper.dart';
import 'package:demo_social_app/widgets/app_buttons/app_primary_button.dart';
import 'package:get/get.dart';

class LoginPhoneController extends GetxController {
  String? _email;
String? _pass;
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

  void onEmailSaved(String? newValue) {
    _email = newValue!.trim();
  }
  void onPassSaved(String? newValue) {
    _pass = newValue!.trim();
  }


  void loginEmail() {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      buttonKey.currentState?.showLoader();
      AuthHelper.emailLogin(_email!,_pass!).then((value) {
        if(value != null) {
          Get.offNamed(
        DashboardPage.routeName
        );
        }
        log('email then ${value}');
      }).catchError((e, s) {
        SnackBarHelper.show(e.toString());
      }).whenComplete(() => buttonKey.currentState?.hideLoader());
    }
  }
}
