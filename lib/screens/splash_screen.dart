import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Helloo")),
        body: Center(
            child: Text(
          "Welcome",
          style: Theme.of(context).textTheme.headline5,
        )));
  }
}
