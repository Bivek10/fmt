import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fmt/app/network/api_error.dart';
import 'package:fmt/config/config.dart';
import 'package:fmt/utils/messages.dart';
import '../../global_constants.dart';

const Duration timeoutDuration = Duration(seconds: 60);

class APIHandler {
  static initDio() {
    dio = Dio(BaseOptions(baseUrl: Config.apiUrl));
  }

  static Future<dynamic> hitApi(Future<Response<dynamic>> response) async {
    Completer<dynamic> completer = Completer<dynamic>();
    try {
      var res = await response;
      completer.complete(res.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        APIError apiError = APIError(
          error: parseError(e.response!.data),
          status: 403,
          onAlertPop: () {},
        );
        completer.complete(apiError);
      } else if (e.response?.statusCode == 400) {
        APIError apiError = APIError(
          error: parseError(e.response!.data),
          message: e.response!.data,
          status: 400,
        );
        completer.complete(apiError);
      } else if (e.response?.statusCode == 401) {
        APIError apiError = APIError(
          error: parseError(e.response!.data),
          status: 401,
        );
        completer.complete(apiError);
      } else {
        APIError apiError = APIError(
            error: parseError(e.response?.data ?? ""),
            message: e.response?.data ?? "",
            status: e.response?.statusCode ?? 0);
        completer.complete(apiError);
      }
    } catch (e) {
      APIError apiError = APIError(error: Messages.genericError, status: 500);
      completer.complete(apiError);
    }
    return completer.future;
  }

  static String parseError(dynamic response) {
    try {
      var error = response["error"];
      if (error == null) {
        return error;
      }
      return error['message'];
    } catch (e) {
      return Messages.genericError;
    }
  }

  static String parseErrorMessage(dynamic response) {
    try {
      return response["message"];
    } catch (e) {
      return Messages.genericError;
    }
  }
}
