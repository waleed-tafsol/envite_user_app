import 'CatagoryModel.dart';

class PackagesModel {
  String? sId;
  String? slug;
  String? slugId;
  Name? name;
  int? price;
  String? packageType;
  String? eventType;
  int? invites;
  String? packageFor;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? duration;

  PackagesModel(
      {this.sId,
      this.slug,
      this.slugId,
      this.name,
      this.price,
      this.packageType,
      this.eventType,
      this.invites,
      this.packageFor,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.duration});

  PackagesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    price = json['price'];
    packageType = json['packageType'];
    eventType = json['eventType'];
    invites = json['invites'];
    packageFor = json['packageFor'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    duration = json['duration'];
  }

}
