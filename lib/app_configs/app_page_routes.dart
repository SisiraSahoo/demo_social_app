import 'package:demo_social_app/pages/authenticaton/login_email/login_email_page.dart';
import 'package:demo_social_app/pages/authenticaton/register_user/register_user_page.dart';
import 'package:demo_social_app/pages/dashboard/add_post/add_post_page.dart';
import 'package:demo_social_app/pages/dashboard/bindings/dashboard_binding.dart';
import 'package:demo_social_app/pages/dashboard/dashboard_page.dart';
import 'package:demo_social_app/pages/dashboard/profile/profile_page.dart';
import 'package:demo_social_app/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPages {
  /// NOT TO BE USE NOW
  static final pages = [
    GetPage(name: SplashPage.routeName, page: () => const SplashPage()),
    GetPage(name: LoginEmailPage.routeName, page: () => const LoginEmailPage()),
    GetPage(name: RegisterUserPage.routeName, page: () => const RegisterUserPage()),
    GetPage(
        name: DashboardPage.routeName,
        page: () => const DashboardPage(),
    binding: DashboardBinding(),
    children: [
      GetPage(name: ProfilePage.routeName, page:() =>const ProfilePage()),
      GetPage(name: AddPostPage.routeName, page:() =>const AddPostPage())
    ]
    )
  ];
}
