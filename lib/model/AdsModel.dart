import 'package:event_planner_light/constants/ApiConstant.dart';

class AdsModel {
  String? sId;
  String? slug;
  String? slugId;
  String? name;
  String? image;
  String? startDate;
  String? endDate;
  String? createdBy;
  List<String>? tags;
  String? status;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AdsModel(
      {this.sId,
      this.slug,
      this.slugId,
      this.name,
      this.image,
      this.startDate,
      this.endDate,
      this.createdBy,
      this.tags,
      this.status,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AdsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'];
    image =
        json['image'] != null ? ApiConstants.s3bucket + json['image'] : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdBy = json['createdBy'];
    tags = json['tags'].cast<String>();
    status = json['status'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
