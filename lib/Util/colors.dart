import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color(0xFFb30013);
  static const kPrimary2Color = Color(0xFF120633);
  static const kPrimary3Color = Color(0xFFC0DEDC);
  static const kTextColor = Color(0xff120633);
  static const kInputColor = Color(0xffF9F9F9);
  static const kInputIconColor = Color(0xff1C274C);
  static const kPrimaryLightColor = Colors.white;
  static const kPrimaryDarkColor = Color(0xFF15141F);
  static const kPrimaryDark2Color = Color(0xff001226);
  static const kPrimaryDark3Color = Color(0xff191825);
  static const kSecondaryColor = Color.fromARGB(255, 134, 134, 134);
  static const kContainerColor = Color(0xffF3F3F3);
  static const Color shadow = Color.fromARGB(60, 170, 170, 170);
  static const Color shadow2 = Color.fromARGB(255, 25, 24, 37);
  static const Color success = Color(0xFF40C7A5);
  static const Color error = Color(0xFFE84C5C);
  static const boxShadow = BoxShadow(
    color: shadow,
    blurRadius: 10,
    offset: Offset(0, 2),
  );
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [kPrimaryColor, kPrimary2Color],
  );
  static const kSuccessGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF40C7A5), Color(0xFF21AD8B)],
  );

  static const kErrorGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE84C5C), Color(0xFFD82D3E)],
  );

  static const kIndividualGradientColor = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [kPrimary2Color, Color(0xff004EF8)],
  );
}
