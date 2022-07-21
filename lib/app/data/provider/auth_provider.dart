// import 'dart:convert';

import 'package:barbearia_jl_app/app/data/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthApiClient  extends GetConnect{

  Future<Map<String,dynamic>> login(String email,String password) async{

     var response = await post(baseUrl + "/login", {"email": email, "password": password});

     if(response.statusCode == 200){
      return response.body;
    }else{
      Get.defaultDialog(title: "Login", content: Text("Login/Senha não confere."));
      return null;
    }
  }

  Future<Map<String,dynamic>> register(String name,String email,String password) async{
    return null;
    // try{
    //   var response = await http.post(Uri.parse("$baseUrl/register"), body: {
    //     "name" : name,
    //     "email" : email,
    //     "password" : password
    //   });
  
    //   if (response.statusCode == 200) {
    //     return json.decode(response.body);
    //   }else{
    //     Get.defaultDialog(title: "Cadastro",content: Text(json.decode(response.body)['message']));
    //     // ignore: prefer_interpolation_to_compose_strings, avoid_print
    //     print('erro -get: '+ response.body);
    //   }

    // }catch(err){
    //   Get.defaultDialog(title: "Cadastro",content: Text(err));
    //   // ignore: avoid_print
    //   print(err);
    // }
    // return null;
  }
}