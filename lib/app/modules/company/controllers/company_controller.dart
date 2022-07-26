import 'package:barbearia_jl_app/app/data/model/company_model.dart';
import 'package:barbearia_jl_app/app/data/model/service_model.dart';
import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController {

  final Company company = Get.arguments;

  void createScheduling(Service service){
    Get.toNamed(Routes.SCHEDULES);
  }

}
