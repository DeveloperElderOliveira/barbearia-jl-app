import 'package:barbearia_jl_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class BottomNavCustom extends StatelessWidget {
  
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4)
            ],
          ),
      width: Get.width,
      child: Obx(
        () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.items.map((item) {
          var itemIndex = controller.items.indexOf(item);
          return GestureDetector(
            onTap: () {          
              controller.choiceIndex(itemIndex);       
              },
                child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 50,
                width: controller.selectedIndex.value == itemIndex ? 120 : 50,
                padding: controller.selectedIndex.value == itemIndex ? const EdgeInsets.only(left: 16, right: 16) : null,
                decoration: controller.selectedIndex.value == itemIndex
                    ? BoxDecoration(
                        color: item.color,
                        borderRadius: const BorderRadius.all(Radius.circular(50)))
                    : null,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconTheme(
                          data: IconThemeData(
                            size: 24,
                            color: controller.selectedIndex.value == itemIndex ? controller.backgroundColorNav : Colors.black,
                          ),
                          child: item.icon,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: controller.selectedIndex.value == itemIndex
                              ? DefaultTextStyle.merge(
                                  style: TextStyle(color: controller.backgroundColorNav),
                                  child: item.title)
                              : Container(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
          );
        }).toList(),
      ),
      ),
    );
  }
}