import '../constants/ApiConstant.dart';

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
  List<String>? emails;
  List<String>? socialLinks;
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
      this.emails,
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
      final List<String> imagesData = json['images'].cast<String>();
      for (var i = 0; i < imagesData.length; i++) {
        images!.add(ApiConstants.s3bucket + imagesData[i]);
      }
    }
    videos = json['videos'].cast<String>();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    address = json['address'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    category = json['category'];
    createdBy = json['createdBy'];
    attendees = json['attendees'].cast<String>();
    noOfInvites = json['noOfInvites'];
    tags = json['tags'].cast<String>();
    emails = json['emails'].cast<String>();
    socialLinks = json['socialLinks'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
