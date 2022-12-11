import 'package:e_commerce_app/common/app_routes.dart';
import 'package:e_commerce_app/presentation%20layer/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/app_theme.dart';
import 'data layer/providers/auth_provider.dart';
import 'data layer/providers/main_provider.dart';
import 'data layer/providers/tabs_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
        saveLocale: true,
        startLocale: const Locale('ar', 'EG'),
        path: 'assets/translations',
        fallbackLocale: const Locale('ar', 'EG'),
        useFallbackTranslations: true,
        // assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => TabsProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: AppTheme.appTheme,
        onGenerateRoute: AppRoutes().generateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
