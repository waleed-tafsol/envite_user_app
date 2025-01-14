import 'dart:async';

import 'package:envite_user_app/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  static const routeName = 'Splash_screen';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      //Get.offNamed(AuthScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   PopScope(
        canPop: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                Assets.splash_vector,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Image.asset(
                Assets.app_Logo,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
