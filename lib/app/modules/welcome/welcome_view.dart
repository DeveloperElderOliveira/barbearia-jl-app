import 'package:barbearia_jl_app/app/modules/welcome/welcome_controller.dart';
import 'package:barbearia_jl_app/app/modules/welcome/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../global/widgets/rounded_button.dart';

// ignore: use_key_in_widget_constructors
class WelcomeView extends GetView<WelcomeController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    // ignore: prefer_const_constructors
    body: Background(
      // ignore: prefer_const_constructors
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            Text(
              "BEM VINDO A BARBEARIA JL",
              // ignore: prefer_const_constructors
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Get.height * 0.05),
            
            SvgPicture.asset(
              "assets/logo.svg",
              height: Get.height * 0.45,
            ),
            SizedBox(height: Get.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Get.offAndToNamed('/login');
              },
            ),
            RoundedButton(
              text: "REGISTRAR",
              color: Get.theme.primaryColorLight,
              textColor: Colors.black,
              press: () {
                Get.offAndToNamed('/signup');
              },
            ),
          ],
        ),
      ),
    ), 
    );
  }
}