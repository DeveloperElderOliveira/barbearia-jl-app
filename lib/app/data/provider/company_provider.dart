import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CompanyApiClient extends GetConnect{

final box = GetStorage('barbearia-jl');

getAll() async {
  String token = box.read('auth').accessToken;
    var response = await get("$baseUrl/companies",
      headers: {"Authorization": 'Bearer ' + token});

    if(response.hasError){
      Get.defaultDialog(title: "Error Catch",content: Text("${response.statusText}"));
    }

    if( response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Error",
          content: Text("${response.body['error']}"));
          return null;
    }
}

}