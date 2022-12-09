import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case Constants.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      // case signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignUpScreen(),
      //   );
      //
      // case logInScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const LogInScreen(),
      //   );
    }
    return null;
  }
}
