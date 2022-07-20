import 'package:barbearia_jl_app/app/data/provider/schedule_provider.dart';
import 'package:barbearia_jl_app/app/data/repository/schedule_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<ScheduleRepository>(
      () => ScheduleRepository(),
    );

    Get.lazyPut<ScheduleApiClient>(
      () => ScheduleApiClient(),
    );
  }
}
