import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:e_commerce_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import 'constants.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case Constants.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Constants.tabsScreen:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      case Constants.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );

      case Constants.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
    }
    return null;
  }
}
