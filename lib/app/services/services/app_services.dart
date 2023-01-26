import 'package:dio/dio.dart';
import 'package:fmt/app/network/api_error.dart';
import 'package:fmt/app/network/api_handler.dart';
import 'package:fmt/app/network/api_url.dart';
import 'package:fmt/app/services/questions/question_request_response.dart';
import 'package:fmt/app/services/quiz_history/quiz_history_request.dart';
import 'package:fmt/app/services/quiz_history/quiz_history_request_response.dart';
import 'package:fmt/app/services/quizs/quiz_request_response.dart';
import 'package:fmt/app/services/register/register_request_model.dart';
import 'package:fmt/app/services/register/register_request_response.dart';
import 'package:fmt/global_constants.dart';

import '../repositories/app_repo.dart';

class AppRepoImplementaion implements AppRepo {
  @override
  Future getUserRegister({RegisterRequestModel? request}) async {
    final response = await APIHandler.hitApi(dio.post(
      APIs.register,
      data: request!.toJson(),
      options: Options(headers: {
        "Content-Type": "application/json",
      }),
    ));
    if (response is APIError) {
      return response;
    } else {
      return RegisterRequestResponse.fromJson(response);
    }
  }

  @override
  Future getQuizData() async {
    final response = await APIHandler.hitApi(dio.get(
      APIs.quizsData,
      options: Options(headers: {
        "Content-Type": "application/json",
      }),
    ));
    if (response is APIError) {
      return response;
    } else {
      return QuizRequestResponse.fromJson(response);
    }
  }

  @override
  Future getQuestionData({String? quizID}) async {
    final response = await APIHandler.hitApi(dio.get(
      APIs.questions + quizID!,
      options: Options(headers: {
        "Content-Type": "application/json",
      }),
    ));
    if (response is APIError) {
      return response;
    } else {
      return QuestionRequestResponse.fromJson(response);
    }
  }

  @override
  Future postQuizHistory({QuizHistoryRequest? request}) async {
    final response = await APIHandler.hitApi(dio.post(
      APIs.quizHistory,
      data: request!.toJson(),
      options: Options(headers: {
        "Content-Type": "application/json",
      }),
    ));
    if (response is APIError) {
      return response;
    } else {
      return QuizHistoryRequestResponse.fromJson(response);
    }
  }
}
