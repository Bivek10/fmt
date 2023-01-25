import 'package:dio/dio.dart';
import 'package:fmt/app/network/api_error.dart';
import 'package:fmt/app/network/api_handler.dart';
import 'package:fmt/app/network/api_url.dart';
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
}
