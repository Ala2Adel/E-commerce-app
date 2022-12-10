import 'package:flutter/material.dart';

import 'app_colours.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Tajawal',
    // floatingActionButtonTheme:FloatingActionButtonThemeData() ,
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: AppColors.darkGrey,
        labelPadding: EdgeInsets.only(bottom: 2,top: 2),
        labelColor: AppColors.primaryColor,
        unselectedLabelStyle: TextStyle(
          color: AppColors.greyText,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Tajawal',
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          color: AppColors.greyText,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Tajawal',
        )),
    textTheme: const TextTheme(
      button: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600),
      headline4: TextStyle(color: AppColors.lightOrange, fontSize: 19, fontWeight: FontWeight.w600),
      headline5: TextStyle(color: AppColors.greyText, fontSize: 16, fontWeight: FontWeight.w500),
      subtitle2: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500),
      subtitle1: TextStyle(color: AppColors.greyText, fontSize: 12, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(color: AppColors.greyText, fontSize: 14, fontWeight: FontWeight.w500),
    ),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightGrey,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      toolbarHeight: 34,
      centerTitle: true,
      titleTextStyle:
          TextStyle(color: AppColors.greyText, fontSize: 14, fontWeight: FontWeight.w500),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.lightOrange),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          )),
      // enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(4.0),
      //     ),
      //     borderSide: BorderSide(
      //       color: AppColors.primaryColor,
      //       width: 1,
      //     )),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      filled: true,
      fillColor: AppColors.white,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.orange,
        ),
      ),
      errorStyle: TextStyle(
        color: AppColors.orange,
        fontFamily: "Tajawal",
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
          fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(40)),
          alignment: Alignment.center,
          textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600))),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.orange,
      elevation: 2.0,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: TextStyle(color: AppColors.white),
    ),
  );
}
