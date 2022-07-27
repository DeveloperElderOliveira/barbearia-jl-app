
// import 'package:barbearia_jl_app/app/data/model/service_model.dart';
import 'package:barbearia_jl_app/app/data/provider/schedule_provider.dart';
import 'package:get/get.dart';

import '../model/schedule_model.dart';

class ScheduleRepository {

final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

Future<List<Schedule>> getAll() async{
  List<Schedule> list = <Schedule>[];
  var response = await apiClient.getAll();
  if (response != null){
    response.forEach((e) {
      list.add(Schedule.fromJson(e));
    });
  }

  return list;
}

add(String date, String time, serviceId, userId) async{
  return Schedule.fromJson(await apiClient.add(date, time, serviceId,userId));
}

}