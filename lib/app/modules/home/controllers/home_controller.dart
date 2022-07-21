import 'package:barbearia_jl_app/app/data/model/auth_model.dart';
import 'package:barbearia_jl_app/app/data/model/schedule_model.dart';
import 'package:barbearia_jl_app/app/data/repository/schedule_repository.dart';
import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../global/widgets/navigation_item.dart';

class HomeController extends GetxController {

  //Essential
  final box = GetStorage('barbearia-jl');
  final repository = Get.find<ScheduleRepository>();

  //Bottom Nav Custom
  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(const Icon(Icons.home), const Text('Início'), Colors.deepPurpleAccent),
    NavigationItem(const Icon(Icons.search), const Text('Procurar'), Colors.pinkAccent),
    NavigationItem(const Icon(Icons.person_outline), const Text('Perfil'), Colors.teal)
  ];

  // Page 1
  RxList<Schedule> listSchedules = <Schedule>[].obs;
  
  // Page 3
  Auth auth;


  @override
  void onInit() {
    // loadData();
    super.onInit();
    
  }

  void onReady()
  {
    super.onReady();
    loadData();
  }

  void choiceIndex(int index){
    selectedIndex.value = index;
  }

  void loadData() async{
    await repository.getAll().then((value){
      listSchedules.assignAll(value);
    });
  }

  void logout(){
    box.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

}
