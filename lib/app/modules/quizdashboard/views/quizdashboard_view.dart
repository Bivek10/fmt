import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/widgets/molecules/empty_app_bar.dart';
import 'package:fmt/utils/theme/colors.dart';

import 'package:get/get.dart';

import '../controllers/quizdashboard_controller.dart';

class QuizdashboardView extends GetView<QuizdashboardController> {
  const QuizdashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: const EmptyAppBar(statusBarColor: AppColors.backgroundColor3),
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: AppColors.gradient2,
        ),
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
                  text: 'Choose ',
                  style: Get.theme.textTheme.headline2,
                  children: [
                    TextSpan(
                      text: 'Your Speciality',
                      style: Get.theme.textTheme.headline1,
                    ),
                    TextSpan(
                      text: ' and \n',
                      style: Get.theme.textTheme.headline2,
                    ),
                    TextSpan(
                      text: 'play Quiz',
                      style: Get.theme.textTheme.headline1!.copyWith(
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
