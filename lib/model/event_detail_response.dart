import 'package:event_planner_light/model/event_model.dart';

import '../constants/ApiConstant.dart';

class EventDetailResponse {
  String? status;
  EventDetailData? data;

  EventDetailResponse({this.status, this.data});

  EventDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new EventDetailData.fromJson(json['data'])
        : null;
  }
}

class EventDetailData {
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
  String? startTime;
  String? endTime;
  String? category;
  CreatedBy? createdBy;
  List<Attendees>? attendees;
  int? noOfInvites;
  List<String>? tags;
  List<String>? emails;
  List<String>? socialLinks;
  List<EventModel>? similarEvents;
  int? ratingsAverage;
  int? ratingQuantity;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  EventDetailData(
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
      this.startTime,
      this.endTime,
      this.category,
      this.createdBy,
      this.attendees,
      this.noOfInvites,
      this.tags,
      this.emails,
      this.socialLinks,
      this.ratingsAverage,
      this.ratingQuantity,
      this.status,
      this.similarEvents,
      this.createdAt,
      this.updatedAt,
      this.iV});

  EventDetailData.fromJson(Map<String, dynamic> json) {
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
    if (json['videos'] != null) {
      videos = <String>[];
      final List<String> videosData = json['videos'].cast<String>();
      for (var i = 0; i < videosData.length; i++) {
        videos!.add(ApiConstants.s3bucket + videosData[i]);
      }
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    address = json['address'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    category = json['category'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    if (json['attendees'] != null) {
      attendees = <Attendees>[];
      json['attendees'].forEach((v) {
        attendees!.add(new Attendees.fromJson(v));
      });
    }
    if (json['similarEvents'] != null) {
      similarEvents = <EventModel>[];
      json['similarEvents'].forEach((v) {
        similarEvents!.add(EventModel.fromJson(v));
      });
    }
    noOfInvites = json['noOfInvites'];
    tags = json['tags'].cast<String>();
    emails = json['emails'].cast<String>();
    socialLinks = json['socialLinks'].cast<String>();
    ratingsAverage = json['ratingsAverage'];
    ratingQuantity = json['ratingQuantity'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Attendees {
  String? sId;
  String? slug;
  String? fullName;
  String? photo;
  String? email;

  Attendees({this.sId, this.slug, this.fullName, this.photo, this.email});

  Attendees.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    fullName = json['fullName'];
    photo = ApiConstants.s3bucket + json['photo'];
    email = json['email'];
  }
}

class CreatedBy {
  String? sId;
  String? slug;
  String? fullName;
  String? photo;
  String? email;

  CreatedBy({this.sId, this.slug, this.fullName, this.photo, this.email});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    fullName = json['fullName'];
    photo = ApiConstants.s3bucket + json['photo'];
    email = json['email'];
  }
}

class Location {
  String? type;
  List<num>? coordinates;
// demo
  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['coordinates'] != null) {
      coordinates = <num>[];
      json['coordinates'].forEach((v) {
        coordinates!.add(v);
      });
    }
    // coordinates = json['coordinates'];
  }
}
