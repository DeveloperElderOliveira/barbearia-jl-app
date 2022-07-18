import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/auth_model.dart';
import '../../routes/app_routes.dart';

class InitialController extends GetxController {

final box = GetStorage('barbearia-jl');
Auth auth;

// ignore: non_constant_identifier_names
String verify_auth(){
    auth = box.read('auth');
    // ignore: deprecated_member_use
    if(auth != null){
      return Routes.HOME;
    }else{
      return Routes.WELCOME;
    }
}

}