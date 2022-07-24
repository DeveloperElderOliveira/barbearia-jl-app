
import 'package:barbearia_jl_app/app/data/model/company_model.dart';
import 'package:barbearia_jl_app/app/data/provider/company_provider.dart';
import 'package:get/get.dart';

class CompanyRepository {

final CompanyApiClient apiClient = Get.find<CompanyApiClient>();

Future<List<Company>> getAll() async{
  List<Company> list = <Company>[];
  var response = await apiClient.getAll();
  if (response != null){
    response.forEach((e) {
      list.add(Company.fromJson(e));
    });
  }
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