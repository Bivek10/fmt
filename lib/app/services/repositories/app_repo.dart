import 'package:fmt/app/services/register/register_request_model.dart';

abstract class AppRepo {
  Future getUserRegister({RegisterRequestModel? request});

  Future getQuizData();
  Future getQuestionData({String? quizID});
}
