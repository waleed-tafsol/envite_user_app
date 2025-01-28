import 'CatagoryModel.dart';

class TopupsModel {
  String? sId;
  String? slug;
  String? slugId;
  Name? name;
  int? price;
  String? packageType;
  String? eventType;
  String? packageFor;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TopupsModel(
      {this.sId,
      this.slug,
      this.slugId,
      this.name,
      this.price,
      this.packageType,
      this.eventType,
      this.packageFor,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  TopupsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    price = json['price'];
    packageType = json['packageType'];
    eventType = json['eventType'];
    packageFor = json['packageFor'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

}
