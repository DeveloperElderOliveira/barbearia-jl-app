import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScheduleApiClient extends GetConnect{

final box = GetStorage('barbearia-jl');

getAll() async {

  String token = box.read('auth').accessToken;
      var response = await get(
        "$baseUrl/schedules",
        headers: {"Authorization" : 'Bearer ' + token}
        );
      
      if(response.hasError){
        box.erase();
        Get.offAllNamed(Routes.WELCOME);
      }

      if (response.statusCode == 200) {
        return response.body;
      }else{
        Get.defaultDialog(title: "Error",content: Text("${response.body['error']}"));
      }

}

add(String date, String time, serviceId, userId) async{
  var auth = box.read('auth');
      var token = auth.accessToken;
      var dt = date.split('/');
      var newDate = dt[2] + '-' + dt[1] + '-' +dt[0] + ' ' + time + ':00';
      
      var response = await post(
        "$baseUrl/schedules",
        {
          "scheduling_date" : "$newDate",
          "user_id" : "$userId",
          "employee_id" : "1",
          "service_id" : "$serviceId"
        },
        headers: {"Authorization" : 'Bearer ' + token}
        ); 

      if (response.hasError){
        Get.defaultDialog(title: "Error Catch", content: Text("${response.statusText}"));
      }

      if (response.statusCode == 200) {
        return response.body;
      }else{
        Get.defaultDialog(title: "Error",content: Text("${response.body['error']}"));
        return null;
      }
}

}