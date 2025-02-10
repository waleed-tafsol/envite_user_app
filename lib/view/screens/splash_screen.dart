import 'dart:async';

import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/assets.dart';
import '../../controllers/Auth_services.dart';

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

    Future.delayed(Duration(seconds: 2), () {
      _checkAuthTokenAndNavigate();
    });
  }

  Future<void> _checkAuthTokenAndNavigate() async {
    if (await authService.isAuthenticated.value) {
      Get.offNamed(NavBarScreen.routeName);
    } else {
      Get.offNamed(AuthScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
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
                width: 60.w,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
