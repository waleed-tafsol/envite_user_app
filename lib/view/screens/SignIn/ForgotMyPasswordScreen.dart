import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotMyPasswordEmailScreen extends StatelessWidget {
  const ForgotMyPasswordEmailScreen({super.key});
  static const routeName = "ForgotMyPasswordEmailScreen";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text(
            "Hello Again!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome back to Invites App",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(ForgotMyPasswordConfirmScreen.routeName);
                      },
                      style: StylesConstants.elevated_b_redBack_whiteFore,
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotMyPasswordConfirmScreen extends StatelessWidget {
  const ForgotMyPasswordConfirmScreen({super.key});
  static const routeName = "ForgotMyPasswordConfirmScreen";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text(
            "Hello Again!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome back to Invites App",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: Icon(Icons.visibility_off),
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: "Re-enter Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(SigninScreen.routeName);
                      },
                      style: StylesConstants.elevated_b_redBack_whiteFore,
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
