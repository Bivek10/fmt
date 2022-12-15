import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: const EmptyAppBar(),
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
            CostumButton(
              btnName: "Join Now",
              btnEvent: () {},
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
