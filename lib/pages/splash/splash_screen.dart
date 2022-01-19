import 'package:flutter/material.dart';
import 'package:demo_social_app/utils/app_auth_helper.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // AuthHelper.refreshAccessToken().whenComplete(() {
      AuthHelper.checkUserLevel();
      // });
      // Get.offAllNamed(LoginPhonePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
         '',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
