import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fmt/app/network/api_error.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/app/services/register/register_request_model.dart';
import 'package:fmt/app/services/repositories/app_repo.dart';
import 'package:fmt/app/services/services/app_services.dart';
import 'package:fmt/app/widgets/circular_loader.dart';
import 'package:fmt/app/widgets/components/common_widget.dart';
import 'package:fmt/global_constants.dart';
import 'package:fmt/utils/memory_management.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  RxBool showPassword = true.obs;
  AppRepo? appRepo;
  RegisterRequestModel registerRequestModel = RegisterRequestModel();
  BuildContext? context;
  CircularLoader? circularLoader;

  @override
  void onInit() {
    circularLoader = Get.put(CircularLoader());
    appRepo = Get.put(AppRepoImplementaion());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return "Email is invalid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be atleast 6 character";
    }
    return null;
  }

  validateData() async {
    if (formKey1.currentState!.validate()) {
      try {
        circularLoader!.showCircularLoader(context!);
        UserCredential response =
            await firebaseAuthInstace.signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        String tokenID = await response.user!.getIdToken();
        MemoryManagement.setFirebaseToken(tokenID: tokenID);
        MemoryManagement.setUserName(username: "username");
        Get.toNamed(Routes.QUIZDASHBOARD);
        // final responses =
        //     await appRepo!.getUserRegister(request: registerRequestModel);
        // circularLoader!.hideCircularLoader();
        // if (responses is APIError) {
        //   errorMessage(message: responses.error.toString());
        // } else if (responses is RegisterRequestResponse) {
        //   // String tokenID = await response.user!.getIdToken();
        // MemoryManagement.setFirebaseToken(tokenID: tokenID);
        // MemoryManagement.setUserName(username: userNameController.text);
        //   // successMessage(message: responses.msg);
        //   // Get.toNamed(Routes.QUIZDASHBOARD);
        // }
      } on FirebaseAuthException catch (e) {
        errorMessage(message: e.message);
      }
    }
  }
}
