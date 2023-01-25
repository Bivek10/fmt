import 'package:get/get.dart';

import '../controllers/quizdashboard_controller.dart';

class QuizdashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizdashboardController>(
      () => QuizdashboardController(),
    );
  }
}
