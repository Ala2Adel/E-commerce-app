import 'package:flutter/material.dart';

import '../presentation layer/screens/login_screen.dart';
import '../presentation layer/screens/signup_screen.dart';
import '../presentation layer/screens/splash_screen.dart';
import '../presentation layer/screens/tabs_screen.dart';
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
