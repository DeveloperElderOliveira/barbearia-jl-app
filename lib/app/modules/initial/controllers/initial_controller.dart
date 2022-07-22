import 'package:barbearia_jl_app/app/data/model/auth_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_routes.dart';

class InitialController extends GetxController {

final box = GetStorage('barbearia-jl');
var auth;

// ignore: non_constant_identifier_names
String verifyAuth(){
    auth = box.read('auth');
    // ignore: deprecated_member_use
    if(auth != null){
      box.erase();
      auth = Auth.fromJson(auth);
      box.write('auth', auth);
      return Routes.HOME;
    }else{
      return Routes.WELCOME;
    }
}

}