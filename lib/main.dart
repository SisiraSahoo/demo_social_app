import 'package:flutter/material.dart';
import 'package:demo_social_app/app_configs/app_theme.dart';
import 'package:demo_social_app/pages/splash/splash_screen.dart';
import 'package:demo_social_app/utils/shared_preference_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_configs/app_page_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.preferences = await SharedPreferences.getInstance();
// SharedPreferenceHelper.preferences!.clear();
  /// Setup for no tification services
  // InAppNotification.configureInAppNotification();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // initDynamicLinks();
  }

  // void _goToLink(PendingDynamicLinkData data) {
  //   if (data == null) return;
  //   final Uri deepLink = data.link;
  //   if (deepLink != null) {
  //     switch (deepLink.path) {
  //       case '/profile':
  //         String id = deepLink.queryParameters['id'];
  //         Get.toNamed(OtherProfilePage.routeName, arguments: id);
  //         break;
  //     }
  //   }
  // }
  //
  // Future<void> initDynamicLinks() async {
  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData data) async {
  //         _goToLink(data);
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hotel Lubumbashi',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      // defaultTransition: Transition.fadeIn,
      initialRoute: SplashPage.routeName,
      getPages: AppPages.pages,
    );
  }
}
