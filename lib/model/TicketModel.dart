import 'package:event_planner_light/constants/ApiConstant.dart';

class TicketModel {
  String? title;
  String? description;
  String? ticketNumber;
  String? createdBy;
  String? status;
  String? image;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TicketModel(
      {this.title,
      this.description,
      this.ticketNumber,
      // this.createdBy,
      this.status,
      this.image,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  TicketModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ticketNumber = json['ticketNumber'];
    // createdBy = json['createdBy'];
    image = ApiConstants.s3bucket + json['image'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['ticketNumber'] = ticketNumber;
    // data['createdBy'] = this.createdBy;
    data['image'] = image;
    data['status'] = status;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
