// import 'CatagoryModel.dart';

// class PackagesModel {
//   String? sId;
//   String? slug;
//   String? slugId;
//   Name? name;
//   int? price;
//   String? packageType;
//   String? eventType;
//   int? invites;
//   String? packageFor;
//   bool? isActive;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   int? duration;

//   PackagesModel(
//       {this.sId,
//       this.slug,
//       this.slugId,
//       this.name,
//       this.price,
//       this.packageType,
//       this.eventType,
//       this.invites,
//       this.packageFor,
//       this.isActive,
//       this.createdAt,
//       this.updatedAt,
//       this.iV,
//       this.duration});

//   PackagesModel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     slug = json['slug'];
//     slugId = json['slugId'];
//     name = json['name'] != null ? Name.fromJson(json['name']) : null;
//     price = json['price'];
//     packageType = json['packageType'];
//     eventType = json['eventType'];
//     invites = json['invites'];
//     packageFor = json['packageFor'];
//     isActive = json['isActive'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     duration = json['duration'];
//   }

// }

class AddonsModel {
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

  AddonsModel(
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

  AddonsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['slug'] = slug;
    data['slugId'] = slugId;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['price'] = price;
    data['packageType'] = packageType;
    data['eventType'] = eventType;
    data['packageFor'] = packageFor;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ar'] = ar;
    data['_id'] = sId;
    return data;
  }
}
