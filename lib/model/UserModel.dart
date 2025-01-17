import 'package:event_planner_light/model/SubscriptionModel.dart';
import 'package:event_planner_light/model/WalletModel.dart';

import 'LocationModel.dart';

class UserModel {
  Location? location;
  String? sId;
  String? slug;
  String? slugId;
  String? fullName;
  String? photo;
  String? email;
  String? phoneNumber;
  Wallet? wallet;
  List<String>? role;
  List<String>? fcmTokens;
  int? totalInvites;
  int? remainingInvites;
  int? totalAddonInvites;
  int? remainingAddonInvites;
  List<String>? socketIds;
  bool? isOnline;
  bool? isVerified;
  bool? isBlockedByAdmin;
  List<String>? categories;
  List<String>? myEvents;
  List<UserModel>? myStaff;
  UserModel? createdBy;
  String? description;
  List<Subscriptions>? subscriptions;
  List<String>? uniqueDeviceIds;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? loginAt;
  String? password;

  UserModel(
      {this.location,
      this.sId,
      this.slug,
      this.slugId,
      this.fullName,
      this.photo,
      this.email,
      this.phoneNumber,
      this.wallet,
      this.role,
      this.fcmTokens,
      this.totalInvites,
      this.remainingInvites,
      this.totalAddonInvites,
      this.remainingAddonInvites,
      this.socketIds,
      this.isOnline,
      this.isVerified,
      this.isBlockedByAdmin,
      this.categories,
      this.myEvents,
      this.myStaff,
      this.createdBy,
      this.description,
      this.subscriptions,
      this.uniqueDeviceIds,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.loginAt,
      this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    fullName = json['fullName'];
    photo = json['photo'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    role = json['role'].cast<String>();
    if (json['fcmTokens'] != null) {
      fcmTokens = <String>[];
      json['fcmTokens'].forEach((v) {
        fcmTokens!.add(v);
      });
    }
    totalInvites = json['totalInvites'];
    remainingInvites = json['remainingInvites'];
    totalAddonInvites = json['totalAddonInvites'];
    remainingAddonInvites = json['remainingAddonInvites'];
    if (json['socketIds'] != null) {
      socketIds = <String>[];
      json['socketIds'].forEach((v) {
        socketIds!.add(v);
      });
    }
    isOnline = json['isOnline'];
    isVerified = json['isVerified'];
    isBlockedByAdmin = json['isBlockedByAdmin'];
    categories = json['categories'].cast<String>();
    if (json['myEvents'] != null) {
      myEvents = <String>[];
      json['myEvents'].forEach((v) {
        myEvents!.add(v);
      });
    }
    if (json['myStaff'] != null) {
      myStaff = <UserModel>[];
      json['myStaff'].forEach((v) {
        myStaff!.add(UserModel.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    description = json['description'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
    if (json['uniqueDeviceIds'] != null) {
      uniqueDeviceIds = <String>[];
      json['uniqueDeviceIds'].forEach((v) {
        uniqueDeviceIds!.add(v);
      });
    }
    lastLogin = json['lastLogin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    loginAt = json['loginAt'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    data['slug'] = this.slug;
    data['slugId'] = this.slugId;
    data['fullName'] = this.fullName;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    data['role'] = this.role;
    if (this.fcmTokens != null) {
      data['fcmTokens'] = this.fcmTokens!.map((v) => v).toList();
    }
    data['totalInvites'] = this.totalInvites;
    data['remainingInvites'] = this.remainingInvites;
    data['totalAddonInvites'] = this.totalAddonInvites;
    data['remainingAddonInvites'] = this.remainingAddonInvites;
    if (this.socketIds != null) {
      data['socketIds'] = this.socketIds!.map((v) => v).toList();
    }
    data['isOnline'] = this.isOnline;
    data['isVerified'] = this.isVerified;
    data['isBlockedByAdmin'] = this.isBlockedByAdmin;
    data['categories'] = this.categories;
    if (this.myEvents != null) {
      data['myEvents'] = this.myEvents!.map((v) => v).toList();
    }
    if (this.myStaff != null) {
      data['myStaff'] = this.myStaff!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['description'] = this.description;
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    if (this.uniqueDeviceIds != null) {
      data['uniqueDeviceIds'] = this.uniqueDeviceIds!.map((v) => v).toList();
    }
    data['lastLogin'] = this.lastLogin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['loginAt'] = this.loginAt;
    data['password'] = this.password;
    return data;
  }
}
