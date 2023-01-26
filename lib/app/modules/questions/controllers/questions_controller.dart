import 'package:flutter/material.dart';
import 'package:fmt/app/network/api_error.dart';
import 'package:fmt/app/services/questions/question_request_response.dart';
import 'package:fmt/app/services/quiz_history/quiz_history_request.dart';
import 'package:fmt/app/services/quiz_history/quiz_history_request_response.dart';
import 'package:fmt/app/services/quizs/quiz_request_response.dart';
import 'package:fmt/app/services/repositories/app_repo.dart';
import 'package:fmt/app/services/services/app_services.dart';
import 'package:fmt/app/widgets/circular_loader.dart';
import 'package:fmt/app/widgets/components/common_widget.dart';
import 'package:fmt/utils/memory_management.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  final count = 0.obs;
  Data? data;

  AppRepo? appRepo;
  CircularLoader? circularLoader;
  BuildContext? context;
  QuestionRequestResponse questionRequestResponse = QuestionRequestResponse();
  List<QuestionData> questionData = [];
  String? choiceID;
  RxList<int> selectedChoice = <int>[].obs;
  int quizScore = 0;

  @override
  void onInit() {
    circularLoader = Get.put(CircularLoader());
    appRepo = Get.put(AppRepoImplementaion());
    data = Get.arguments["data"];
    getQuestions();
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

  getQuestions() async {
    //circularLoader!.showCircularLoader(context!);
    final response =
        await appRepo!.getQuestionData(quizID: data!.id.toString());
    print(data!.id.toString());
    //circularLoader!.hideCircularLoader();
    print(response);
    if (response is APIError) {
      errorMessage(message: response.error);
    } else if (response is QuestionRequestResponse) {
      questionData = response.questionData!;
      selectedChoice.clear();
      for (var i = 0; i < questionData.length; i++) {
        selectedChoice.add(0);
      }
      print(selectedChoice);
      //questionRequestResponse = response;

      update();
    }
  }

  onSelectedChoice({required int index, required selectedChoiceID}) {
    selectedChoice.removeAt(index);
    selectedChoice.insert(index, selectedChoiceID);
  }

  submitQuiz() {
    quizScore = 0;
    for (var i = 0; i < questionData.length; i++) {
      List<Choices> choices = questionData[i].choices!;
      for (var j = 0; j < choices.length; j++) {
        if (choices[j].id == selectedChoice[i]) {
          if (choices[j].isCorrect == 1) {
            quizScore = quizScore + 1;
          }
        }
      }
    }

    postScore();
  }

  postScore() async {
    successMessage(message: "You have scored $quizScore !");
    circularLoader!.showCircularLoader(context!);
    QuizHistoryRequest quizHistoryRequest = QuizHistoryRequest(
        quizId: data!.id,
        score: quizScore,
        userId: MemoryManagement.getUserUID());
    circularLoader!.hideCircularLoader();
    final response =
        await appRepo!.postQuizHistory(request: quizHistoryRequest);
    if (response is APIError) {
      errorMessage(message: response.error);
    } else if (response is QuizHistoryRequestResponse) {
      successMessage(message: response.msg);
      Get.back();
    }
  }
}
