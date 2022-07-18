import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repository/auth_repository.dart';

class SignupController extends GetxController {

  final repository = Get.find<AuthRepository>();
  final formkey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  User user;
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  
  void register() async{
     if (formkey.currentState.validate()){
       loading.value = true;
       // ignore: missing_return
       User user = await repository.register(nameCtrl.text,emailCtrl.text ,passwordCtrl.text).catchError((e){
          loading.value = false;
        });  
       // ignore: deprecated_member_use
       if (!user.isNull){
          Get.offAllNamed(Routes.LOGIN);
       }        
     loading.value = false;
  }
}

void toLogin()
{
  Get.toNamed(Routes.LOGIN);
}
}