import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payments_controller.dart';

class PaymentsView extends GetView<PaymentsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PaymentsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
