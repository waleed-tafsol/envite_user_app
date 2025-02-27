class NotificationResponseModel {
  String? status;
  List<NotificationModel>? data;
  int? totalRecords;
  int? results;
  int? unseenNotificationsCount;

  NotificationResponseModel(
      {this.status,
      this.data,
      this.totalRecords,
      this.results,
      this.unseenNotificationsCount});

  NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <NotificationModel>[];
      json['data'].forEach((v) {
        data!.add(NotificationModel.fromJson(v));
      });
    }
    totalRecords = json['totalRecords'];
    results = json['results'];
    unseenNotificationsCount = json['unseenNotificationsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalRecords'] = this.totalRecords;
    data['results'] = this.results;
    data['unseenNotificationsCount'] = this.unseenNotificationsCount;
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

  NotificationModel(
      {this.sId,
      this.title,
      this.message,
      this.sender,
      this.senderMode,
      this.notificationType,
      this.userType,
      this.seen,
      this.createdAt,
      this.updatedAt,
      this.iV});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    message = json['message'];
    sender = json['sender'];
    senderMode = json['senderMode'];
    notificationType = json['notificationType'];
    userType = json['userType'].cast<String>();
    seen = json['seen'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['sender'] = this.sender;
    data['senderMode'] = this.senderMode;
    data['notificationType'] = this.notificationType;
    data['userType'] = this.userType;
    data['seen'] = this.seen;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
