import 'package:barbearia_jl_app/app/data/model/auth_model.dart';
import 'package:barbearia_jl_app/app/data/model/employee_model.dart';
import 'package:barbearia_jl_app/app/data/model/service_model.dart';
import 'package:barbearia_jl_app/app/data/repository/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class SchedulesController extends GetxController {

  Auth auth;
  final box = GetStorage('barbearia-jl');
  var userId;
  List<Service> service = Get.arguments;
  var servicesName = '';
  int servicesPrice = 0;
  final repository = Get.find<ScheduleRepository>();
  final formkey = GlobalKey<FormState>();
  DateTime datePicked;
  TimeOfDay timePicked;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  Employee employee;
  
  @override
  void onInit(){
    auth = box.read('auth');
    userId = auth.user.id;
    concatInfoServices();
    super.onInit();
  }
  void concatInfoServices()
  {
    service.forEach((element) {
      if (servicesName != ''){
        servicesName += ' & ' + element.name; 
      }else{
        servicesName = element.name;
      }
      servicesPrice += element.price;
    });
    
  }
  void openCalendar() async{
    FocusScope.of(Get.context).requestFocus(new FocusNode());
    datePicked = await showDatePicker(
      context: Get.context,
      initialDate: datePicked ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101)
      );
      if (datePicked != null && datePicked != DateTime.now()){
        dateController.text = DateFormat("dd/MM/yyyy").format(DateTime.parse(datePicked.toString()));
        loadHorarios();
      }
  }

  void openEmployeePage(){
    // Get.toNamed(Routes.EMPLOYEE);
  }

  void onsave() {
    print('aki');
    if(formkey.currentState.validate()){
      // var serviceId = service.id;
      // var response = await repository.add(dateController.text, timeController.text, serviceId, userId);
      // if(response != null){
      //   print('ok1');
      //   Get.back(result: "OK");
      // }
    }
  }
  void loadHorarios()
  {
    print('teste cara da minha');
  }
}
