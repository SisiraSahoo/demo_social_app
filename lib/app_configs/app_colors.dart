import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
mixin AppColors {
  static const brightBackground = Color(0xfff8f8f8);
  static const darkBackground = Color(0xff3e3e3e);
  static const borderColor = Color(0xffCEDCE5);

  static const MaterialColor brightPrimary =
      MaterialColor(brightPrimaryValue, <int, Color>{
    50: Color(0xFFEBF2E8),
    100: Color(0xFFCCDEC6),
    200: Color(0xFFABC8A0),
    300: Color(0xFF89B179),
    400: Color(0xFF6FA15D),
    500: Color(brightPrimaryValue),
    600: Color(0xFF4F883A),
    700: Color(0xFF457D32),
    800: Color(0xFF3C732A),
    900: Color(0xFF2B611C),
  });
  static const int brightPrimaryValue = 0xFF569040;
}
