import 'package:alfalPay/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);
double horizontalPadding = 30;

const appBarText = TextStyle(
  fontFamily: "Tajawal",
  fontSize: 18,
  color: AppColors.kTextColor,
  fontWeight: FontWeight.w600,
);

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.kPrimaryLightColor,
    fontFamily: "Tajawal",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: AppColors.kPrimaryLightColor,
      titleTextStyle: appBarText,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.kTextColor),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.kTextColor,
        height: 1.5,
      ),
      bodyLarge: TextStyle(
        color: AppColors.kTextColor,
      ),
      bodyMedium: TextStyle(
        color: AppColors.kTextColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.only(
        right: 40,
        left: 40,
        top: 40,
        bottom: 0,
      ),
      filled: true,
      fillColor: AppColors.kInputColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: AppColors.kSecondaryColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: AppColors.kPrimaryColor),
        gapPadding: 10,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData themeDark() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.kPrimaryDarkColor,
    fontFamily: "Tajawal",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.kPrimaryDarkColor,
      foregroundColor: AppColors.kPrimaryLightColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.kPrimaryLightColor),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryLightColor,
        height: 1.5,
      ),
      bodyLarge: TextStyle(
        color: AppColors.kPrimaryLightColor,
      ),
      bodyMedium: TextStyle(
        color: AppColors.kPrimaryLightColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.only(
        right: 40,
        left: 40,
        top: 40,
        bottom: 0,
      ),
      filled: true,
      fillColor: AppColors.kPrimaryDarkColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: AppColors.kPrimaryLightColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: AppColors.kPrimaryColor),
        gapPadding: 10,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
