import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'utilities/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EGP')],
        saveLocale: true,
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        useFallbackTranslations: true,
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: const SplashScreen(),
    );
  }
}
