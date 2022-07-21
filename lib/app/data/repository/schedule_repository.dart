
import 'package:barbearia_jl_app/app/data/provider/schedule_provider.dart';
import 'package:get/get.dart';

import '../model/schedule_model.dart';

class ScheduleRepository {

final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

Future<List<Schedule>> getAll() async{
  List<Schedule> list = <Schedule>[];
  var response = await apiClient.getAll();
  response.forEach((e) {
    list.add(Schedule.fromJson(e));
  });

  return list;
}
// getId(id){
//   return api.getId(id);
// }
// delete(id){
//   return api.delete(id);
// }
// edit(obj){
//   return api.edit( obj );
// }
// add(obj){
//     return api.add( obj );
// }

}