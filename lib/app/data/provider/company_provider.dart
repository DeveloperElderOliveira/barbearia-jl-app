import 'dart:convert';
import 'package:barbearia_jl_app/app/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CompanyApiClient {

final http.Client httpClient = http.Client();
final box = GetStorage('barbearia-jl');

getAll() async {
  try {
    String token = box.read('auth').accessToken;
    var response = await http.get(Uri.parse("$baseUrl/companies"),
      headers: {"Authorization": 'Bearer ' + token});
    if( response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      Get.defaultDialog(
          title: "Error",
          content: Text("${json.decode(response.body)['error']}"));
    }
  }catch(err) {
      Get.defaultDialog(
          title: "Error Catch",
          content: Text("$err"));
  }
}

}