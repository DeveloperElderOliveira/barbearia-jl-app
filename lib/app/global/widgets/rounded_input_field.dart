import 'package:barbearia_jl_app/app/global/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
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
          return null;
        },
        controller: controller,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Get.theme.primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}