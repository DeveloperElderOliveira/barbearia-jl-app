import 'package:barbearia_jl_app/app/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/auth_model.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
    final repository = Get.find<AuthRepository>();
    Auth auth;
    final formkey = GlobalKey<FormState>();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();

    RxBool showPassword = false.obs;
    RxBool loading = false.obs;
    final box = GetStorage('barbearia-jl');

    void login() async{
      if (formkey.currentState.validate()){
        loading.value = true;
        var auth = await repository.login(emailCtrl.text, passwordCtrl.text).catchError((e){
          loading.value = false;
        });
        // ignore: deprecated_member_use
        if(!auth.isNull){
          box.write('auth',auth);
          Get.offAllNamed(Routes.HOME);
        }
        loading.value = false;
      }
    }

    void toRegister(){
      Get.offAndToNamed(Routes.SIGNUP);
    }

}