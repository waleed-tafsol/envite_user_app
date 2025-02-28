import 'package:event_planner_light/constants/ApiConstant.dart';

import 'LocationModel.dart';
import 'SubscriptionModel.dart';
import 'WalletModel.dart';

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
  // List<String>? uniqueDeviceIds;
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
      // this.uniqueDeviceIds,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.loginAt,
      this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    fullName = json['fullName'];
    photo = ApiConstants.s3bucket + json['photo'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    wallet =
        json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    role = json['role'].cast<String>();
    if (json['fcmTokens'] != null) {
      fcmTokens = <String>[];
      json['fcmTokens'].forEach((v) {
        fcmTokens!.add(v);
      });
    }
    totalInvites = json['totalInvites'] + json['totalAddonInvites'];
    remainingInvites = json['remainingInvites'] + json['remainingAddonInvites'];
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
        subscriptions!.add(Subscriptions.fromJson(v));
      });
    }
    // if (json['uniqueDeviceIds'] != null) {
    //   uniqueDeviceIds = <String>[];
    //   json['uniqueDeviceIds'].forEach((v) {
    //     uniqueDeviceIds!.add(v);
    //   });
    // }
    lastLogin = json['lastLogin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    loginAt = json['loginAt'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    data['slug'] = slug;
    data['slugId'] = slugId;
    data['fullName'] = fullName;
    data['photo'] = photo;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    data['role'] = role;
    if (fcmTokens != null) {
      data['fcmTokens'] = fcmTokens!.map((v) => v).toList();
    }
    data['totalInvites'] = totalInvites;
    data['remainingInvites'] = remainingInvites;
    data['totalAddonInvites'] = totalAddonInvites;
    data['remainingAddonInvites'] = remainingAddonInvites;
    if (socketIds != null) {
      data['socketIds'] = socketIds!.map((v) => v).toList();
    }
    data['isOnline'] = isOnline;
    data['isVerified'] = isVerified;
    data['isBlockedByAdmin'] = isBlockedByAdmin;
    data['categories'] = categories;
    if (myEvents != null) {
      data['myEvents'] = myEvents!.map((v) => v).toList();
    }
    if (myStaff != null) {
      data['myStaff'] = myStaff!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = createdBy;
    data['description'] = description;
    if (subscriptions != null) {
      data['subscriptions'] =
          subscriptions!.map((v) => v.toJson()).toList();
    }
    // if (this.uniqueDeviceIds != null) {
    //   data['uniqueDeviceIds'] = this.uniqueDeviceIds!.map((v) => v).toList();
    // }
    data['lastLogin'] = lastLogin;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['loginAt'] = loginAt;
    data['password'] = password;
    return data;
  }
}
