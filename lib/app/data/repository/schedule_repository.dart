import 'package:get/get.dart';
import '../model/schedule_model.dart';
import '../provider/schedule_provider.dart';

class ScheduleRepository {

final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

getAll() async{
  List<Schedule> list = <Schedule>[];
  var response = await apiClient.getAll(); 

  response.forEach((e){ 
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