import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ratings_controller.dart';

class RatingsView extends GetView<RatingsController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RatingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RatingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
