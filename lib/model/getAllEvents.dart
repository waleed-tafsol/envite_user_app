class GetAllEvents {
  String? status;
  List<Data>? data;
  int? results;
  int? totalRecords;

  GetAllEvents({this.status, this.data, this.results, this.totalRecords});

  GetAllEvents.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    results = json['results'];
    totalRecords = json['totalRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['results'] = this.results;
    data['totalRecords'] = this.totalRecords;
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    slugId = json['slugId'];
    name = json['name'];
    eventType = json['eventType'];
    avenue = json['avenue'];
    description = json['description'];
    images = json['images'].cast<String>();
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['slug'] = this.slug;
    data['slugId'] = this.slugId;
    data['name'] = this.name;
    data['eventType'] = this.eventType;
    data['avenue'] = this.avenue;
    data['description'] = this.description;
    data['images'] = this.images;
    data['videos'] = this.videos;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['address'] = this.address;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['category'] = this.category;
    data['createdBy'] = this.createdBy;
    data['attendees'] = this.attendees;
    data['noOfInvites'] = this.noOfInvites;
    data['tags'] = this.tags;
    data['emails'] = this.emails;
    data['socialLinks'] = this.socialLinks;
    data['ratingsAverage'] = this.ratingsAverage;
    data['ratingQuantity'] = this.ratingQuantity;
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
