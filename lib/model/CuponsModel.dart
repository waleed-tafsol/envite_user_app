
class CuponsModel {
  String? sId;
  String? slug;
  String? slugId;
  String? name;
  String? userType;
  bool? forSpecificUsers;
  List<String>? users;
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
        this.iV
      });

  CuponsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'];
    userType = json['userType'];
    forSpecificUsers = json['forSpecificUsers'];
    users = json['users'].cast<String>();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['slug'] = slug;
    data['slugId'] = slugId;
    data['name'] = name;
    data['userType'] = userType;
    data['forSpecificUsers'] = forSpecificUsers;
    data['users'] = users;
    data['couponType'] = couponType;
    data['code'] = code;
    data['amountOrDiscount'] = amountOrDiscount;
    data['usesPerCoupon'] = usesPerCoupon;
    data['usesPerUser'] = usesPerUser;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
