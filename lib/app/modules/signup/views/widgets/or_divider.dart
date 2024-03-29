import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
      width: Get.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OU",
              style: TextStyle(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    // ignore: prefer_const_constructors
    return Expanded(
      // ignore: prefer_const_constructors
      child: Divider(
        // ignore: prefer_const_constructors
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}