class Subscriptions {
  String? subscription;
  String? type;
  String? eventType;
  String? startDate;
  String? endDate;
  int? price;
  int? duration;
  int? totalInvites;
  bool? isSubscriptionExpired;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Subscriptions(
      {this.subscription,
      this.type,
      this.eventType,
      this.startDate,
      this.endDate,
      this.price,
        this.duration,
      this.totalInvites,
      this.isSubscriptionExpired,
      this.sId,
      this.createdAt,
      this.updatedAt});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    subscription = json['subscription'];
    type = json['type'];
    eventType = json['eventType'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    price = json['price'];
    duration = json['duration'];
    totalInvites = json['totalInvites'];
    isSubscriptionExpired = json['isSubscriptionExpired'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscription'] = this.subscription;
    data['type'] = this.type;
    data['eventType'] = this.eventType;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['totalInvites'] = this.totalInvites;
    data['isSubscriptionExpired'] = this.isSubscriptionExpired;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
