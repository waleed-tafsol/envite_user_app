import 'dart:convert';

import 'package:event_planner_light/utills/enums.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/ApiConstant.dart';
import '../constants/constants.dart';
import '../controllers/Auth_services.dart';
import '../firebase_options.dart';
import '../model/NotificationResponseModel.dart';
import '../model/PushNotificationModel.dart';
import '../view/screens/Drawer/Screens/supportScreen/supportScreen.dart';
import '../view/screens/NavBar/Screens/EventDetailScreen/events_detail_screen.dart';
import '../view/screens/NavBar/Screens/my_invites/PaymentWebView.dart';
import 'LocalNotificationServices.dart';
import 'customPrint.dart';

class FirebaseService {
  // Singleton pattern
  static final FirebaseService _instance = FirebaseService._internal();
  FirebaseService._internal();
  factory FirebaseService() => _instance;

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static String? fcmToken;

  // Initialize Firebase
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      ColoredPrint.green("Firebase Initialized");

      await requestNotificationPermission();

      _setupPushNotifications();

      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        fcmToken = token;
        ColoredPrint.green("FCM Token: $token");
      } else {
        ColoredPrint.red("Failed to get FCM token");
      }

      _setupPushNotifications();
    } catch (e) {
      ColoredPrint.red("Error initializing Firebase: $e");
    }
  }

  // Push Notification Setup
  static void _setupPushNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      ColoredPrint.green("message recived");
      if (message.data.isNotEmpty) {
        final LocalNotificationService notificationService =
            LocalNotificationService();
        await notificationService.initialize();
        notificationService.showNotification(
          id: 0,
          title: message.notification!.title ?? 'New Notification',
          body: message.notification!.body ?? 'You have a new message.',
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      try {
        // Map<String, dynamic> jsondata = jsonDecode(message.data);

        if (message.notification != null) {
          final receivedNotification =
              PushNotificatificationModel.fromJson(message);
          ColoredPrint.green(
              "onMessageOpenedApp: ${receivedNotification.notificationType}");
          switch (receivedNotification.notificationType) {
            case "announcement":
              Get.dialog(Dialog(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        receivedNotification.title ?? 'Announcement',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      k2hSizedBox,
                      Text(
                        receivedNotification.message ??
                            'You have a new announcement.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      k1hSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                fontSize: 16.sp,
                                // color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));

              break;
            case "registration":
              break;
            case "ads":
              break;
            case "supportTicket":
              Get.toNamed(SupportScreen.routeName);
              break;
            case "event":
              // Get.toNamed(EventsDetailScreen.routeName,
              //   arguments: {"slug": event!.slug ?? ""});
              break;
            case "subscription":
              Get.toNamed(
                PaymentWebviewScreen.routeName,
                arguments: {
                  'url':
                      '${ApiConstants.upgradePlan}${authService.me.value!.slug}',
                },
              );
              break;
            default:
              throw "Unknown notification type: ${receivedNotification.notificationType}";
          }
        } else {
          throw "Notification null";
        }
      } catch (e) {
        ColoredPrint.red("Error in onMessageOpenedApp: $e");
      }
    });
  }

  static Future<void> setupBackgroundHandler() async {
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  static Future<void> backgroundMessageHandler(RemoteMessage message) async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      ColoredPrint.green('Background message: ${message.notification?.title}');
      if (message.notification != null) {
        ColoredPrint.green(
            'Background message: ${message.notification?.title}');

        // Check if the memoryId exists in the payload

        // Map<String, dynamic> jsondata = jsonDecode(message.data["payload"]);

        // final receivedNotification = NotificationModel.fromJson(jsondata);
        //   String? memoryId = message.data['memoryId'];
        //   if (memoryId != null) {
        //     ColoredPrint.green(
        //         "Navigating to Memory Detail with memoryId: $memoryId");
        //     // Navigate to MemoryDetailScreen with memoryId as a parameter
        //     Get.toNamed(MemoryDetailScreen.routeName, arguments: memoryId);
        //   }
        // } else {
        //   ColoredPrint.magenta('Background message with no notification');
        // }
      }
    } catch (e) {
      ColoredPrint.red("Error initializing Firebase in background: $e");
    }
  }

  // Notification Permissions
  static Future<void> requestNotificationPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      ColoredPrint.green("Notification permission granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      ColoredPrint.yellow("Notification permission granted provisionally");
    } else {
      ColoredPrint.red("Notification permission denied");
    }
  }
}
