import 'dart:convert';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import '../../../constants/ApiConstant.dart';

class ForgotMyPasswordEmailScreen extends StatelessWidget {
  ForgotMyPasswordEmailScreen({super.key});
  static const routeName = "ForgotMyPasswordEmailScreen";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _submit() async {
    try {
      if (_formKey.currentState!.validate()) {
        Get.dialog(const Center(child: CircularProgressIndicator()),
            barrierDismissible: false);
        final response = await http.post(
          Uri.parse(ApiConstants.forgotPassword),
          body: jsonEncode({
            "email": _emailController.value.text,
          }),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 201) {
          Get.back();
          CustomSnackbar.showSuccess("Success", "Otp sent to your email");
          Get.toNamed(OtpScreen.routeName, arguments: {
            "email": _emailController.value.text,
            "isForgotPassword": true
          });
        } else {
          if (response.body.isNotEmpty) {
            final jsonresponse = json.decode(response.body);
            throw Exception(
                jsonresponse["message"]["error"][0] ?? "An error occurred");
          } else {
            Exception("An error occurred");
          }
        }
      }
    } catch (e) {
      Get.back();
      CustomSnackbar.showError("Error", e.toString());
    }
  }

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
                    height: 6.h,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          } else if (!GetUtils.isEmail(value)) {
                            return "Please enter a valid email";
                          } else {
                            return null;
                          }
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                        )),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () {
                        _submit();
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

class ForgotMyPasswordConfirmScreen extends StatefulWidget {
  const ForgotMyPasswordConfirmScreen({super.key});
  static const routeName = "ForgotMyPasswordConfirmScreen";

  @override
  State<ForgotMyPasswordConfirmScreen> createState() =>
      _ForgotMyPasswordConfirmScreenState();
}

class _ForgotMyPasswordConfirmScreenState
    extends State<ForgotMyPasswordConfirmScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _submit({
    String? email,
    String? otp,
  }) async {
    try {
      if (_formKey.currentState!.validate()) {
        Get.dialog(const Center(child: CircularProgressIndicator()),
            barrierDismissible: false);
        final response = await http.post(
          Uri.parse(ApiConstants.resetPassword),
          body: jsonEncode({
            "email": email,
            "password": _passwordController.value.text,
            "confirmPassword": _confirmPasswordController.value.text,
            "code": otp,
          }),
          headers: {
            'Content-Type': 'application/json',
          },
        );
        final jsonresponse = json.decode(response.body);
        if (response.statusCode == 201) {
          Get.back();
          CustomSnackbar.showSuccess("Success", "Password Reset Successfull");
          // authService.setAuthToken(jsonresponse["data"]["token"]);
          Get.until((route) => route.settings.name == SigninScreen.routeName);
        } else {
          throw Exception(
              jsonresponse["message"]["error"][0] ?? "An error occurred");
        }
      }
    } catch (e) {
      Get.back();
      CustomSnackbar.showError("Error", e.toString());
    }
  }

  late Map<String, dynamic> args;

  @override
  void initState() {
    super.initState();
    Get.arguments != null ? args = Get.arguments : null;
  }

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
              child: Form(
                key: _formKey,
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
                        controller: _passwordController,
                        validator: (value) {
                          if (_passwordController.value.text.isEmpty) {
                            return "Please Enter Your Password";
                          } else {
                            return null;
                          }
                        },
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: passwordVisible
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off),
                          ),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (_confirmPasswordController.value.text.isEmpty) {
                            return "Please Enter Your Password";
                          } else if (_confirmPasswordController.value.text !=
                              _passwordController.value.text) {
                            return "Password Don't Match";
                          } else {
                            return null;
                          }
                        },
                        obscureText: !confirmPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          hintText: "Re-enter Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                confirmPasswordVisible =
                                    !confirmPasswordVisible;
                              });
                            },
                            icon: confirmPasswordVisible
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off),
                          ),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 6.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _submit(
                              email: args["email"] ?? "",
                              otp: args["otp"],
                            );
                          }
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
      ),
    );
  }
}
