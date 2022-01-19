import 'dart:developer';

import 'package:demo_social_app/api_services/base_api.dart';
import 'package:demo_social_app/app_configs/api_routes.dart';
import 'package:demo_social_app/data_models/user.dart';
import 'package:demo_social_app/global_controllers/user_controller.dart';
import 'package:demo_social_app/pages/authenticaton/login_email/login_email_page.dart';
import 'package:demo_social_app/pages/dashboard/dashboard_page.dart';
import 'package:demo_social_app/utils/shared_preference_helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'snackbar_helper.dart';

class AuthHelper {
  static Future<dynamic> emailLogin(String email,String pass) async {
    try{
      final result = await ApiCall.post(
        "authentication",isAuthNeeded: false,
        body: {"email": email, "password": pass, "strategy": "local"},
      );
      log('email result ${result.data}');
      SharedPreferenceHelper.storeUser(
          user: UserResponse.fromJson(result.data));
      SnackBarHelper.show("Login successfully");
      return result.data;
    }catch(e,s){
      log('error email',error: e,stackTrace: s);
      SnackBarHelper.show(e.toString());
    }
  }
  static Future<dynamic> userRegister(String? email,String? pass,String? name,DateTime? dob) async {
    try{
      final result = await ApiCall.post(
        "users",isAuthNeeded: false,
        body: {"email": email, "password": pass, "name":name,
          "dob":DateFormat("MM/dd/yyyy").format(dob!)},
      );
      log('userRegister result ${result.data}');
      SharedPreferenceHelper.storeUser(
          user: UserResponse.fromJson(result.data));
      SnackBarHelper.show("Register successfully");
      return result.data;
    }catch(e,s){
      log('error userRegister',error: e,stackTrace: s);
      SnackBarHelper.show(e.toString());
    }
  }



  
  ///
  /// Checks the user on-boarding
  ///
  static Future<void> checkUserLevel() async {
    final UserResponse? user = SharedPreferenceHelper.user;
    final userController = Get.isRegistered()
        ? Get.find<UserController>()
        : Get.put<UserController>(UserController(), permanent: true);
    if (user != null) {
      userController.updateUser(user.user);
      Get.offAllNamed(DashboardPage.routeName);
    } else {
      Get.offAllNamed(LoginEmailPage.routeName);
    }
  }

  static Future<String?> logoutUser() async {
    // await ApiCall.post('authentication', basePath: ApiRoutes.baseUrl);
    SharedPreferenceHelper.logout();
    Get.offAllNamed(LoginEmailPage.routeName);
    // if (Get.isRegistered<UserController>()) {
    //   Get.find<UserController>().logoutUser();
    // }
  }


  static Future<UserData?> updateUser(Map<String, dynamic> body) async {
    final u = SharedPreferenceHelper.user;
    if (u!.user == null) return null;
    final result =
        await ApiCall.patch(ApiRoutes.user, id: u.user!.id!, body: body);
    final user = UserData.fromJson(result.data);
    u.user = user;
    SharedPreferenceHelper.storeUser(user: u);

    final userController = Get.isRegistered()
        ? Get.find<UserController>()
        : Get.put<UserController>(UserController(), permanent: true);
    userController.updateUser(u.user);
    return user;
  }
}
