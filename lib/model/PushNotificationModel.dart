import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificatificationModel {
  String? notificationId;
  String? notificationType;
  String? pmId;
  String? message;
  String? title;

  PushNotificatificationModel(
      {this.notificationId, this.notificationType, this.pmId});

  PushNotificatificationModel.fromJson(RemoteMessage notification) {
    notificationId = notification.data['notificationId'];
    notificationType = notification.data['notificationType'];
    pmId = notification.data['pmId'];
    message = notification.notification?.body ?? "";
    message = notification.notification?.title ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationId'] = this.notificationId;
    data['notificationType'] = this.notificationType;
    data['pmId'] = this.pmId;
    return data;
  }
}
