import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              controller.clear();
          },
          icon: const Icon(Icons.logout))
        ],
      ),
      // ignore: prefer_const_constructors
      body: Center(
        // ignore: prefer_const_constructors
        child: Text(
          'HomeView is working',
          // ignore: prefer_const_constructors
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
