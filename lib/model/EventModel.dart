class EventModel {
  String? sId;
  String? slug;
  String? slugId;
  String? name;
  String? eventType;
  String? avenue;
  String? description;
  List<String>? images;
  List<String>? videos;
  Location? location;
  String? address;
  String? startDate;
  String? endDate;
  String? category;
  String? createdBy;
  List<String>? attendees;
  int? noOfInvites;
  List<String>? tags;
  List<SocialLinks>? socialLinks;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  EventModel(
      {this.sId,
      this.slug,
      this.slugId,
      this.name,
      this.eventType,
      this.avenue,
      this.description,
      this.images,
      this.videos,
      this.location,
      this.address,
      this.startDate,
      this.endDate,
      this.category,
      this.createdBy,
      this.attendees,
      this.noOfInvites,
      this.tags,
      this.socialLinks,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  EventModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'];
    eventType = json['eventType'];
    avenue = json['avenue'];
    description = json['description'];
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images!.add(v);
      });
    }
    if (json['videos'] != null) {
      videos = <String>[];
      json['videos'].forEach((v) {
        videos!.add(v);
      });
    }
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address = json['address'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    category = json['category'];
    createdBy = json['createdBy'];
    attendees = json['attendees'].cast<String>();
    noOfInvites = json['noOfInvites'];
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    if (json['socialLinks'] != null) {
      socialLinks = <SocialLinks>[];
      json['socialLinks'].forEach((v) {
        socialLinks!.add(new SocialLinks.fromJson(v));
      });
    }
    status = json['status'];
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
    data['eventType'] = this.eventType;
    data['avenue'] = this.avenue;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['address'] = this.address;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['category'] = this.category;
    data['createdBy'] = this.createdBy;
    data['attendees'] = this.attendees;
    data['noOfInvites'] = this.noOfInvites;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v).toList();
    }
    if (this.socialLinks != null) {
      data['socialLinks'] = this.socialLinks!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class SocialLinks {
  String? name;
  String? url;
  String? sId;
  String? createdAt;
  String? updatedAt;

  SocialLinks({this.name, this.url, this.sId, this.createdAt, this.updatedAt});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
