import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/utils/theme/colors.dart';
import 'package:fmt/utils/theme/theme.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 0.h),
        child: const SizedBox(),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 100.h,
        ),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
