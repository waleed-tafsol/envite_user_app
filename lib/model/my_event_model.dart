import 'package:event_planner_light/constants/ApiConstant.dart';

class MyEventModel {
  String? status;
 List<MyEventData>? data;

  MyEventModel({this.status, this.data});

  MyEventModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MyEventData>[];
      json['data'].forEach((v) {
        data!.add(new MyEventData.fromJson(v));
      });
    }
  }
}

class MyEventData {
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
  String? createdBy;
  List<String>? attendees;
  int? noOfInvites;
  List<String>? tags;
  List<String>? emails;
  List<String>? socialLinks;
  int? ratingsAverage;
  int? ratingQuantity;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MyEventData(
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
      this.createdAt,
      this.updatedAt,
      this.iV});

  MyEventData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'];
    eventType = json['eventType'];
    avenue = json['avenue'];
    description = json['description'];
    images = json['images'].cast<String>();
    // if (json['images'] != null) {
    //   images?[0] = ApiConstants.s3bucket + json['images'][0];
    // } else {
    //   images?[0] = '';
    // }
    videos = json['videos'].cast<String>();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    address = json['address'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    category = json['category'];
    createdBy = json['createdBy'];
    attendees = json['attendees'].cast<String>();
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

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }


}
