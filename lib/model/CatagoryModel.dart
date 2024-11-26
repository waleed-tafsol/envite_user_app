class CatagoryModel {
  String? sId;
  String? slug;
  String? slugId;
  Name? name;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CatagoryModel(
      {this.sId,
      this.slug,
      this.slugId,
      this.name,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CatagoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
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
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    data['_id'] = this.sId;
    return data;
  }
}
