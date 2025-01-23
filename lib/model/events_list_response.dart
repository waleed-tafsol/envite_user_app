import 'package:event_planner_light/model/event_model.dart';

class EventsListResponse {
  String? status;
  List<EventModel>? pastEvents ;
  List<EventModel>? upcomingEvents;
  EventsListResponse({this.status,this.pastEvents,  this.upcomingEvents});

  EventsListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['pastEvents'] != null) {
      pastEvents = <EventModel>[];
      json['pastEvents'].forEach((v) {
        pastEvents!.add( EventModel.fromJson(v));
      });
    }


    if (json['upcomingEvents'] != null) {
      upcomingEvents = <EventModel>[];
      json['upcomingEvents'].forEach((v) {
        upcomingEvents!.add( EventModel.fromJson(v));
      });
    }
   /* else{
      upcomingEvents = [];
    }*/
  }

/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.pastEvents != null) {
      data['pastEvents'] = this.pastEvents!.map((v) => v.toJson()).toList();
    }
    if (this.upcomingEvents != null) {
      data['upcomingEvents'] =
          this.upcomingEvents!.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}

