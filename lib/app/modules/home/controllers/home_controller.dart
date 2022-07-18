import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../global/widgets/navigation_item.dart';

class HomeController extends GetxController {
  final box = GetStorage('barbearia-jl');

  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(const Icon(Icons.home), const Text('Início'), Colors.deepPurpleAccent),
    NavigationItem(const Icon(Icons.search), const Text('Procurar'), Colors.pinkAccent),
    // NavigationItem(const Icon(Icons.search), const Text('Search'), Colors.amberAccent),
    NavigationItem(const Icon(Icons.person_outline), const Text('Perfil'), Colors.teal)
  ];

  void choiceIndex(int index){
    selectedIndex.value = index;
  }

  void logout(){
    box.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

}
