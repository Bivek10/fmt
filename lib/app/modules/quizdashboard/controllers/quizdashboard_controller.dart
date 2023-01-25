import 'package:flutter/material.dart';
import 'package:fmt/app/network/api_error.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/app/services/quizs/quiz_request_response.dart';
import 'package:fmt/app/services/repositories/app_repo.dart';
import 'package:fmt/app/services/services/app_services.dart';
import 'package:fmt/app/widgets/circular_loader.dart';
import 'package:fmt/app/widgets/components/common_widget.dart';
import 'package:fmt/global_constants.dart';
import 'package:fmt/utils/memory_management.dart';
import 'package:get/get.dart';

class QuizdashboardController extends GetxController {
  final count = 0.obs;
  AppRepo? appRepo;
  CircularLoader? circularLoader;
  BuildContext? context;
  QuizRequestResponse quizRequestResponse = QuizRequestResponse();
  List<Data> quizData = [];

  @override
  void onInit() {
    circularLoader = Get.put(CircularLoader());
    appRepo = Get.put(AppRepoImplementaion());
    getQuizData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getQuizData() async {
   // circularLoader!.showCircularLoader(context!);
    final response = await appRepo!.getQuizData();
   // circularLoader!.hideCircularLoader();
    if (response is APIError) {
      errorMessage(message: response.error);
    } else if (response is QuizRequestResponse) {
      quizData = response.data!;

      update();
    }
  }

  logout() async {
    firebaseAuthInstace.signOut().then((value) {
      MemoryManagement.clearMemory();
      Get.toNamed(Routes.LOGIN);
    });
  }
}
