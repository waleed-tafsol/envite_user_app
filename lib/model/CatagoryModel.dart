import '../constants/ApiConstant.dart';

class CategoryModel {
  String? sId;
  String? slug;
  String? slugId;
  Name? name;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? icon;

  CategoryModel(
      {this.sId,
      this.slug,
      this.slugId,
      this.name,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.icon});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['icon'] != null) {
      icon = ApiConstants.s3bucket + json['icon'];
    }
    else {icon = '';}
    iV = json['__v'];
  }
}

class Name {
  String? en;
  String? ar;
  String? sId;

  Name({this.en, this.ar, this.sId});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
    sId = json['_id'];
  }
}
