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
  Service service = Get.arguments;
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
    super.onInit();
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
      }
  }

  void openClock() async{
    TimeOfDay time = TimeOfDay.now();
    FocusScope.of(Get.context).requestFocus(new FocusNode());
    timePicked = await showTimePicker(
      context: Get.context,
       initialTime: time,
       );
    if (timePicked != null && timePicked != time) {
      timeController.text = timePicked.format(Get.context);
      time = timePicked;
    }
  }

  void openEmployeePage(){
    // Get.toNamed(Routes.EMPLOYEE);
  }

  void onsave() async{
    if(formkey.currentState.validate()){
      var serviceId = service.id;
      var response = await repository.add(dateController.text, timeController.text, serviceId, userId);
      if(response != null){
        print('ok1');
        Get.back(result: "OK");
      }
    }
  }
}
