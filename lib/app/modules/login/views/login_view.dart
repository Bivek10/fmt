import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: SingleChildScrollView(
      child: Container(
        height: Get.height,
        decoration: const BoxDecoration(gradient: AppColors.gradient2),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text.rich(
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
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    ));
  }
}
