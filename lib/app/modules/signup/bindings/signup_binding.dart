import 'package:barbearia_jl_app/app/data/provider/auth_provider.dart';
import 'package:barbearia_jl_app/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );

    Get.lazyPut<AuthApiClient>(
      () => AuthApiClient(),
    );
  }
}
