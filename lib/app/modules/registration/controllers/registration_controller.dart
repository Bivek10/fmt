import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fmt/app/widgets/components/common_widget.dart';
import 'package:fmt/global_constants.dart';
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

  final count = 0.obs;
  @override
  void onInit() {
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
    if (formKey.currentState!.validate())  {
      try {
        await firebaseAuthInstace.createUserWithEmailAndPassword(
            email: emailController.text,
            password: confrimPasswordController.text);
         
      } on FirebaseAuthException catch (e) {
        print(e.toString());
        
      }
    }
  }
}
