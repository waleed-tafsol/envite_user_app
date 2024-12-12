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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['slug'] = this.slug;
    data['slugId'] = this.slugId;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['price'] = this.price;
    data['packageType'] = this.packageType;
    data['eventType'] = this.eventType;
    data['invites'] = this.invites;
    data['packageFor'] = this.packageFor;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['duration'] = this.duration;
    return data;
  }
}
