import 'package:barbearia_jl_app/app/modules/initial/controllers/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

// ignore: use_key_in_widget_constructors
class InitialView extends GetView<InitialController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 5,
            // ignore: prefer_const_constructors
            gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                // ignore: prefer_const_constructors
                Color(0xff93291E),
                Colors.black,
                // ignore: prefer_const_constructors
                // Colors.cyan
              ],
            ),
            navigateAfterSeconds: controller.verifyAuth(),
            loaderColor: Colors.transparent,
          ),
          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.all(100),
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              image: DecorationImage(
                // ignore: prefer_const_constructors
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}