import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/widgets/atoms/button_text.dart';
import 'package:fmt/app/widgets/atoms/buttons.dart';
import 'package:fmt/app/widgets/components/custom_app_bar.dart';
import 'package:fmt/app/widgets/components/custom_field.dart';
import 'package:fmt/app/widgets/molecules/empty_app_bar.dart';
import 'package:fmt/utils/theme/colors.dart';

import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    controller.context = context;
    return Scaffold(
      appBar: const EmptyAppBar(statusBarColor: AppColors.backgroundColor3),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height * 1.2,
          decoration: const BoxDecoration(
            gradient: AppColors.gradient2,
          ),
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'SignUp,\nFor ',
                      style: Get.theme.textTheme.headline2,
                      children: [
                        TextSpan(
                          text: 'Playing\n',
                          style: Get.theme.textTheme.headline1,
                        ),
                        TextSpan(
                          text: 'and ',
                          style: Get.theme.textTheme.headline2,
                        ),
                        TextSpan(
                          text: 'Learning',
                          style: Get.theme.textTheme.headline1!.copyWith(
                            color: AppColors.orangeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomField(
                    title: "Username",
                    isRequried: true,
                    hinttext: "Username",
                    textEditingController: controller.userNameController,
                    validator: (value) =>
                        controller.validateUsernameName(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomField(
                    title: "Email",
                    isRequried: true,
                    hinttext: "abc@gmail.com",
                    textEditingController: controller.emailController,
                    validator: (value) => controller.validateEmail(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomField(
                    title: "Phone",
                    keyboardInputType: TextInputType.number,
                    isRequried: true,
                    hinttext: "9800965652",
                    textEditingController: controller.phoneController,
                    validator: (value) => controller.validateNumber(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomField(
                    title: "Password",
                    isRequried: true,
                    hinttext: "Password",
                    textEditingController: controller.passwordController,
                    validator: (value) => controller.validatePassword(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomField(
                    title: "Confrim-Password",
                    isRequried: true,
                    hinttext: "Password",
                    validator: (value) =>
                        controller.validateConfirmPassword(value),
                    textEditingController: controller.confrimPasswordController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Button(
                      onPressed: () {
                        controller.validateData();
                      },
                      borderRadius: BorderRadius.circular(8.r),
                      size: ButtonSize.large,
                      fillColor: AppColors.primaryColor,
                      splashColor: AppColors.whiteDimColor,
                      child: Text(
                        " SignUp ",
                        style: Get.theme.textTheme.button,
                      ),
                    ),
                  ),
                  ButtonText(
                    onPressEvent: () {
                      Get.back();
                    },
                    btnName: "Go",
                    btnName1: "Back",
                    style: Get.theme.textTheme.headline4!,
                    style1: Get.theme.textTheme.headline4!.copyWith(
                      color: AppColors.orangeColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
