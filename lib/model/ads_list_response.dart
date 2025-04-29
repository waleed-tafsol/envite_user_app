import 'package:event_planner_light/model/AdsModel.dart';

class AdsListResponse {
  String? status;
  List<AdsModel>? data;
  int? results;
  int? totalRecords;

  AdsListResponse({this.status, this.data, this.results, this.totalRecords});

  AdsListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AdsModel>[];
      json['data'].forEach((v) {
        data!.add(new AdsModel.fromJson(v));
      });
    }
    results = json['results'];
    totalRecords = json['totalRecords'];
  }

}

