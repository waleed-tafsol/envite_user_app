class CmsModel {
  String? status;
  List<Data>? data;

  CmsModel({this.status, this.data});

  CmsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  Content? content;
  String? cmsType;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.content,
      this.cmsType,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    cmsType = json['cmsType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['cmsType'] = this.cmsType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Content {
  String? en;
  String? ar;
  String? sId;

  Content({this.en, this.ar, this.sId});

  Content.fromJson(Map<String, dynamic> json) {
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
