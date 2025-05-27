class EventSchedulesModel {
  String? startDateTime;
  String? endDateTime;
  String? sId;
  String? createdAt;
  String? updatedAt;

  EventSchedulesModel(
      {this.startDateTime,
      this.endDateTime,
      this.sId,
      this.createdAt,
      this.updatedAt});

  EventSchedulesModel.fromJson(Map<String, dynamic> json) {
    startDateTime = json['startDateTime'];
    endDateTime = json['endDateTime'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDateTime'] = this.startDateTime;
    data['endDateTime'] = this.endDateTime;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
