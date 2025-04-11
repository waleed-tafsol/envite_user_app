import 'dart:io';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/utills/Colored_print.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewScreen extends StatefulWidget {
  const PaymentWebviewScreen({super.key});
  static const routeName = 'PaymentWebviewScreen';

  @override
  State<PaymentWebviewScreen> createState() => _PaymentWebviewScreenState();
}

class _PaymentWebviewScreenState extends State<PaymentWebviewScreen> {
  WebViewController controller = WebViewController();
  bool _isLoading = true;
  bool _hasError = false;
  late String url;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      url = Get.arguments['url'];
    }

    // Platform-specific initialization for iOS
    if (Platform.isIOS) {
      // Required for iOS WebView
      controller = WebViewController();
    }

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            ColoredPrint.green("page started loading");

            setState(() {
              _isLoading = true;
              _hasError = false;
            });
          },
          onPageFinished: (String url) {
            ColoredPrint.green("page finished loading");
            setState(() {
              _isLoading = false;
              _hasError = false;
            });
          },
          onHttpError: (HttpResponseError error) {
            ColoredPrint.red(error.request!.uri.path);
            if (!error.request!.uri.path.contains("favicon.ico")) {
              setState(() {
                _isLoading = false;
                _hasError = true;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            ColoredPrint.red(error.errorCode.toString());
            // if (error.errorCode == -10) {
            // setState(() {
            //   _isLoading = false;
            //   _hasError = true;
            //   ColoredPrint.green("in setstate");
            //   controller.goBack();
            // });
            // }
          },
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith('http') ||
                request.url.startsWith('https')) {
              ColoredPrint.yellow('url: ${request.url}');
              if (request.url.contains('success')) {
                // ColoredPrint.green('Payment Success: ${request.url}');
                CustomSnackbar.showSuccess("Success", "Payment Success");
                // Assuming you have a method to handle the success response
                authService.getMe();
                Get.offAllNamed(NavBarScreen.routeName);
              } else if (request.url.contains('cancel')) {
                // ColoredPrint.red('Payment Cancelled: ${request.url}');
                CustomSnackbar.showError("Error", "Payment Cancelled");
                Get.offAllNamed(NavBarScreen.routeName);
              } else {}
              return NavigationDecision.navigate;
            } else {
              ColoredPrint.red('Blocked unknown URL scheme: ${request.url}');
              return NavigationDecision.prevent; // Block unknown schemes
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Visibility(
                visible: !_hasError,
                child: WebViewWidget(controller: controller)),
            if (_isLoading && !_hasError)
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (!_isLoading && _hasError)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 60, color: Colors.red),
                    const SizedBox(height: 10),
                    const Text(
                      'Failed to load page',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                      height: 6.h,
                      width: 40.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                          backgroundColor: WidgetStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                            _hasError = false;
                          });
                          controller.reload();
                        },
                        child: const Text('Retry'),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
