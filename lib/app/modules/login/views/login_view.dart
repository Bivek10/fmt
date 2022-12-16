import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/app/widgets/atoms/button_text.dart';
import 'package:fmt/app/widgets/atoms/buttons.dart';
import 'package:fmt/app/widgets/components/custom_field.dart';
import 'package:fmt/app/widgets/molecules/costum_button.dart';
import 'package:fmt/app/widgets/molecules/empty_app_bar.dart';
import 'package:fmt/functions/image_loader.dart';
import 'package:fmt/utils/assetpath.dart';
import 'package:fmt/utils/theme/colors.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        appBar: const EmptyAppBar(statusBarColor: AppColors.backgroundColor3),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(gradient: AppColors.gradient2),
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.h,
                      width: Get.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child: assetsImage(imagePath: AssetPath.loginImage),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'SignIn,\nFor ',
                        style: Get.theme.textTheme.headline2,
                        children: [
                          TextSpan(
                            text: 'Smart Farming\n',
                            style: Get.theme.textTheme.headline1,
                          ),
                          TextSpan(
                            text: 'and ',
                            style: Get.theme.textTheme.headline2,
                          ),
                          TextSpan(
                            text: 'Agriculture',
                            style: Get.theme.textTheme.headline1!.copyWith(
                              color: AppColors.orangeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomField(
                      title: "Email",
                      isRequried: true,
                      hinttext: "abc@gmail.com",
                      textEditingController: controller.emailController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomField(
                      title: "Password",
                      isRequried: true,
                      hinttext: "Password",
                      textEditingController: controller.passwordController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(8.r),
                        size: ButtonSize.large,
                        fillColor: AppColors.primaryColor,
                        splashColor: AppColors.whiteDimColor,
                        child: Text(
                          " SignIn ",
                          style: Get.theme.textTheme.button,
                        ),
                      ),
                    ),
                    ButtonText(
                      onPressEvent: () {
                        Get.toNamed(Routes.REGISTRATION);
                      },
                      btnName: "New user? ",
                      btnName1: "Create Account",
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
        ));
  }
}
