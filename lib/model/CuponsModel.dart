import 'package:event_planner_light/model/UserModel.dart';

class CuponsModel {
  String? sId;
  String? slug;
  String? slugId;
  String? name;
  String? userType;
  bool? forSpecificUsers;
  List<UserModel>? users;
  String? couponType;
  String? code;
  int? amountOrDiscount;
  int? usesPerCoupon;
  int? usesPerUser;
  String? startDate;
  String? endDate;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CuponsModel(
      {this.sId,
      this.slug,
      this.slugId,
      this.name,
      this.userType,
      this.forSpecificUsers,
      this.users,
      this.couponType,
      this.code,
      this.amountOrDiscount,
      this.usesPerCoupon,
      this.usesPerUser,
      this.startDate,
      this.endDate,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CuponsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'];
    userType = json['userType'];
    forSpecificUsers = json['forSpecificUsers'];
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
    couponType = json['couponType'];
    code = json['code'];
    amountOrDiscount = json['amountOrDiscount'];
    usesPerCoupon = json['usesPerCoupon'];
    usesPerUser = json['usesPerUser'];
    startDate = json['startDate'];
    endDate = json['endDate'];
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
    data['name'] = this.name;
    data['userType'] = this.userType;
    data['forSpecificUsers'] = this.forSpecificUsers;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    data['couponType'] = this.couponType;
    data['code'] = this.code;
    data['amountOrDiscount'] = this.amountOrDiscount;
    data['usesPerCoupon'] = this.usesPerCoupon;
    data['usesPerUser'] = this.usesPerUser;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
