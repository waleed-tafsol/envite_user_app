import 'dart:convert';

import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  
//https://envite-backend-dd-d3e9220ccbc0.herokuapp.com/api/v1
  getAllEvents() async {
    try{
      final response = await http.get(Uri.parse(ApiConstants.getAllEvents));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
    }
  }catch(e){

  }
}
}