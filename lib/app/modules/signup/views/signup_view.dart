// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../global/widgets/already_have_an_account_acheck.dart';
import '../../../global/widgets/rounded_button.dart';
import '../../../global/widgets/rounded_input_field.dart';
import '../../../global/widgets/rounded_password_field.dart';
import '../controllers/signup_controller.dart';
import '../views/widgets/background.dart';

// ignore: use_key_in_widget_constructors
class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
      child: SingleChildScrollView(
        child: Form(
          key: controller.formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "REGISTRAR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.03),
              SvgPicture.asset(
                "assets/barber-shop.svg",
                height: Get.height * 0.30,
              ),
              RoundedInputField(
                hintText: "Nome",
                controller: controller.nameCtrl,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Email",
                controller: controller.emailCtrl,
                onChanged: (value) {},
              ),
              Obx(
                () => RoundedPasswordField(
                showPassword: controller.showPassword.value,
                changeShowPassword: (){
                controller.showPassword.value = !controller.showPassword.value;
                },
                controller: controller.passwordCtrl,
                onChanged: (value) {},
                ),
              ),
               Obx(
                    () => Visibility(
                        visible: !controller.loading.value,
                        child: RoundedButton(
                          text: "REGISTRAR",
                          press: () {
                            controller.register();
                          }, 
                        )
                    ),
                  ),
                  Obx(
                  () => Visibility(
                      visible: controller.loading.value,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: Get.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: const FlatButton(
                            padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 40,
                            ),
                            onPressed: null,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                  ),
                ),
              SizedBox(height: Get.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  controller.toLogin();
                },
              ),
              // OrDivider(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     SocalIcon(
              //       iconSrc: "assets/google-plus.svg",
              //       press: () {},
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
