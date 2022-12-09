import 'package:flutter/material.dart';
import 'app_colours.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Tajawal',
    bottomAppBarColor: AppColors.white,
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: AppColors.darkGrey,
        // labelColor: AppColors.primaryColor,
        unselectedLabelStyle:
            TextStyle(color: AppColors.greyText, fontSize: 12, fontWeight: FontWeight.w500),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle:
            TextStyle(color: AppColors.greyText, fontSize: 12, fontWeight: FontWeight.w500)),
    textTheme: const TextTheme(
        button: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600),
        headline5: TextStyle(color: AppColors.greyText, fontSize: 16, fontWeight: FontWeight.w500),
        subtitle1: TextStyle(color: AppColors.greyText, fontSize: 12, fontWeight: FontWeight.w500),
        bodyText1: TextStyle(color: AppColors.greyText, fontSize: 14, fontWeight: FontWeight.w500)),
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(color: AppColors.darkGrey),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.orange),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColors.greyText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      suffixIconColor: AppColors.black,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          )),
      filled: true,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.orange,
        ),
      ),
      errorStyle: TextStyle(
        color: AppColors.orange,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      fillColor: AppColors.white,
    ),
    buttonTheme: const ButtonThemeData(
      height: 26,
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.orange,
      elevation: 2.0,
      contentTextStyle: TextStyle(color: AppColors.white),
    ),
  );
}
