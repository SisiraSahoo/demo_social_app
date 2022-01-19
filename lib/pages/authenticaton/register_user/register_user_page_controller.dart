import 'dart:developer';

import 'package:demo_social_app/pages/authenticaton/login_email/login_email_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_social_app/utils/app_auth_helper.dart';
import 'package:demo_social_app/utils/snackbar_helper.dart';
import 'package:demo_social_app/widgets/app_buttons/app_primary_button.dart';
import 'package:get/get.dart';

class RegisterUserController extends GetxController {
  String? _email;
  String? _pass;
  String? _name;
  DateTime? _dob;
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
  } void onNameSaved(String? newValue) {
    _name = newValue!.trim();
  } void onDobSaved(DateTime? newValue) {
    _dob = newValue;
    print('dob $_dob');
  }


  void registerEmail() {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      // Get.toNamed(LoginOtpPage.routeName, arguments: {"phone": "1234567890"});
      buttonKey.currentState?.showLoader();

      AuthHelper.userRegister(_email!,_pass!,_name!,_dob!).then((value) {
      Get.back();
        log('user registered then $value');
      }).catchError((e, s) {
        SnackBarHelper.show(e.toString());
      }).whenComplete(() => buttonKey.currentState?.hideLoader());
    }
  }
}
