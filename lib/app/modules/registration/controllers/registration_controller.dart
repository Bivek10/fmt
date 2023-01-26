import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fmt/app/network/api_error.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/app/services/register/register_request_model.dart';
import 'package:fmt/app/services/register/register_request_response.dart';
import 'package:fmt/app/services/repositories/app_repo.dart';
import 'package:fmt/app/services/services/app_services.dart';
import 'package:fmt/app/widgets/circular_loader.dart';
import 'package:fmt/app/widgets/components/common_widget.dart';
import 'package:fmt/global_constants.dart';
import 'package:fmt/utils/memory_management.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrimPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool showPassword = true.obs;
  AppRepo? appRepo;
  RegisterRequestModel registerRequestModel = RegisterRequestModel();
  BuildContext? context;
  CircularLoader? circularLoader;

  final count = 0.obs;
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
    super.onClose();
  }

  void increment() => count.value++;

  String? validateUsernameName(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }
    return null;
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

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Number is required";
    }
    if (value.length < 10 || value.length > 10) {
      return "Phone number must be 10 digits";
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be atleast 6 character";
    }
    if (value != passwordController.text) {
      return "Password didnot matchted";
    }
    return null;
  }

  validateData() async {
    if (formKey.currentState!.validate()) {
      try {
        circularLoader!.showCircularLoader(context!);
        UserCredential response =
            await firebaseAuthInstace.createUserWithEmailAndPassword(
                email: emailController.text,
                password: confrimPasswordController.text);

        registerRequestModel.email = emailController.text;
        registerRequestModel.phoneNumber = phoneController.text;
        registerRequestModel.password = confrimPasswordController.text;
        registerRequestModel.id = response.user!.uid;
        registerRequestModel.fullName = userNameController.text;

        final responses =
            await appRepo!.getUserRegister(request: registerRequestModel);
        circularLoader!.hideCircularLoader();
        if (responses is APIError) {
          errorMessage(message: responses.error.toString());
        } else if (responses is RegisterRequestResponse) {
          String tokenID = await response.user!.getIdToken();
          String userid = response.user!.uid;
          MemoryManagement.setUserUID(uID: userid);
          MemoryManagement.setFirebaseToken(tokenID: tokenID);
          MemoryManagement.setUserName(username: userNameController.text);
          successMessage(message: responses.msg);
          Get.toNamed(Routes.QUIZDASHBOARD);
        }
      } on FirebaseAuthException catch (e) {
        errorMessage(message: e.message);
      }
    }
  }
}
