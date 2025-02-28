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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscription'] = subscription;
    data['type'] = type;
    data['eventType'] = eventType;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['price'] = price;
    data['duration'] = duration;
    data['totalInvites'] = totalInvites;
    data['isSubscriptionExpired'] = isSubscriptionExpired;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
