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
    data['packageFor'] = this.packageFor;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
