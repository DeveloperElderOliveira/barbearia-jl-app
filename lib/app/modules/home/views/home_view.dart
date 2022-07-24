import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global/widgets/bottom_nav_custom.dart';
import '../controllers/home_controller.dart';
import '../views/widgets/page1.dart';
import '../views/widgets/page2.dart';
import '../views/widgets/page3.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbearia JL'),
        centerTitle: true,
      ),
      // ignore: prefer_const_constructors
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Obx(() => Visibility(
              visible: controller.selectedIndex.value == 0,
              child: Page1())),
          Obx(() => Visibility(
              visible: controller.selectedIndex.value == 1,
              child: Page2())),
          Obx(() => Visibility(
              visible: controller.selectedIndex.value == 2,
              child: Page3())),
        ],
      ),
      bottomNavigationBar: BottomNavCustom(),
    );
  }
}
