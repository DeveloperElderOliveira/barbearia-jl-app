import 'package:barbearia_jl_app/app/modules/welcome/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}