import 'package:get/get_rx/get_rx.dart';

class NotificationResponseModel {
  String? status;
  Rx<List<NotificationModel>?> data; // List of notifications
  int? unseenNotificationsCount;

  NotificationResponseModel({
    this.status,
    Rx<List<NotificationModel>?>? data,
    this.unseenNotificationsCount,
  }) : data = data ?? Rx<List<NotificationModel>?>(null);

  NotificationResponseModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        unseenNotificationsCount = json['unseenNotificationsCount'],
        data = Rx<List<NotificationModel>?>(json['data'] != null
            ? List<NotificationModel>.from(
                json['data'].map((v) => NotificationModel.fromJson(v)))
            : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data.value != null) {
      data['data'] = this.data.value!.map((v) => v.toJson()).toList();
    }
    data['unseenNotificationsCount'] = unseenNotificationsCount;
    return data;
  }
}

class NotificationModel {
  String? sId;
  String? title;
  String? message;
  String? sender;
  String? senderMode;
  String? notificationType;
  List<String>? userType;
  bool? seen;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NotificationModel({
    this.sId,
    this.title,
    this.message,
    this.sender,
    this.senderMode,
    this.notificationType,
    this.userType,
    this.seen,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  NotificationModel.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        title = json['title'],
        message = json['message'],
        sender = json['sender'],
        senderMode = json['senderMode'],
        notificationType = json['notificationType'],
        userType =
            json['userType'] != null ? List<String>.from(json['userType']) : [],
        seen = json['seen'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        iV = json['__v'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['message'] = message;
    data['sender'] = sender;
    data['senderMode'] = senderMode;
    data['notificationType'] = notificationType;
    data['userType'] = userType;
    data['seen'] = seen;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
