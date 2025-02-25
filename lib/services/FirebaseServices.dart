import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../firebase_options.dart';
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
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      ColoredPrint.green("message recived");
      if (message.data.isNotEmpty) {}
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      Map<String, dynamic> jsondata = jsonDecode(message.data["payload"]);

      // final receivedNotification = NotificationModel.fromJson(jsondata);
      ColoredPrint.green("onMessageOpenedApp: $jsondata");
      if (jsondata['flag'] == 'memory') {
        try {
          // Response? response = await ApiService.getRequest(
          //     ApiConstants.findMemories + jsondata['payload'][0]['id']);
          // final memory = MemoryModel.fromJson(response?.data);
          // Get.toNamed(
          //   MemoryDetailScreen.routeName,
          //   arguments: memory,
          // );
        } catch (e) {}
      } else if (jsondata['payload']['flag'] == 'subscription') {
        // Get.toNamed(ChooseYourPlanScreen.routeName);
      } else {
        null;
      }
    });
  }

  static Future<void> setupBackgroundHandler() async {
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  static Future<void> backgroundMessageHandler(RemoteMessage message) async {
    if (message.notification != null) {
      ColoredPrint.green('Background message: ${message.notification?.title}');

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
