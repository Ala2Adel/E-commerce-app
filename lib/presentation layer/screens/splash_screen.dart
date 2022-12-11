import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/app_colours.dart';
import '../../common/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = '';

  @override
  void didChangeDependencies() {
    getToken();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        token != '' ? Constants.tabsScreen : Constants.loginScreen,
      ),
    );
    super.didChangeDependencies();
  }

  getToken() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    token = sharedPref.getString(Constants.accessToken) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      "Welcome",
      style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 26, color: AppColors.orange),
    )));
  }
}
