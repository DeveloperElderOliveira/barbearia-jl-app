import 'package:barbearia_jl_app/app/global/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  bool showPassword;
  Function changeShowPassword;

  RoundedPasswordField({
    Key key,
    this.controller,
    this.onChanged,
    this.showPassword = false,
    this.changeShowPassword
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if(value.isEmpty){
            return 'É necessário o preenchimento do campo.';
          }
          if(value.length < 5){
            return 'Campo requer mínimo 6 caracteres.';
          }
          return null;
        },
        controller: controller,
        obscureText: !showPassword,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: Get.theme.primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              color: Get.theme.primaryColor,
            ),
            onPressed: changeShowPassword
            ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}