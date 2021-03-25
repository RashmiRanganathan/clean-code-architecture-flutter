import 'package:clean_code_architecture_flutter/presentation/themes/theme_colors.dart';
import 'package:clean_code_architecture_flutter/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'TTCommons',
    primaryColor: AppColor.primaryColor,
    textTheme: ThemeText.getDefaultTextTheme(),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    scaffoldBackgroundColor: AppColor.white,
    toggleableActiveColor: AppColor.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: AppColor.black,
        primary: AppColor.primaryColor,
      ),
    ),
  );
}
