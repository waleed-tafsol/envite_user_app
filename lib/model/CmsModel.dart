class CmsModel {
  String? status;
  List<Data>? data;

  CmsModel({this.status, this.data});

  CmsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
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
        json['content'] != null ? Content.fromJson(json['content']) : null;
    cmsType = json['cmsType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (content != null) {
      data['content'] = content!.toJson();
    }
    data['cmsType'] = cmsType;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ar'] = ar;
    data['_id'] = sId;
    return data;
  }
}
