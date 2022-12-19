import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/app/widgets/atoms/buttons.dart';
import 'package:fmt/app/widgets/molecules/costum_button.dart';
import 'package:fmt/app/widgets/molecules/empty_app_bar.dart';
import 'package:fmt/functions/image_loader.dart';
import 'package:fmt/utils/assetpath.dart';
import 'package:fmt/utils/theme/colors.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: const EmptyAppBar(
        statusBarColor: AppColors.backgroundColor2,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 100.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: 'Smart Farming \nand ',
                style: Get.theme.textTheme.headline2,
                children: [
                  TextSpan(
                    text: 'Agriculture \n',
                    style: Get.theme.textTheme.headline1,
                  ),
                  TextSpan(
                    text: 'App For ',
                    style: Get.theme.textTheme.headline2,
                  ),
                  TextSpan(
                    text: 'Farmers',
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
            Button(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              borderRadius: BorderRadius.circular(50.r),
              size: ButtonSize.large,
              fillColor: AppColors.primaryColor,
              splashColor: AppColors.whiteDimColor,
              child: Text(
                " Join Now ",
                style: Get.theme.textTheme.button,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 250.h,
        width: Get.width,
        decoration: const BoxDecoration(gradient: AppColors.gradient1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: assetsImage(imagePath: AssetPath.welcomeImage),
        ),
      ),
    );
  }
}
