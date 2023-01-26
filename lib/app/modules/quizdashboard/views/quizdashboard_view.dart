import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/app/widgets/components/custom_app_bar.dart';
import 'package:fmt/app/widgets/components/dashboard_item.dart';
import 'package:fmt/app/widgets/molecules/empty_app_bar.dart';
import 'package:fmt/utils/memory_management.dart';
import 'package:fmt/utils/theme/colors.dart';

import 'package:get/get.dart';

import '../controllers/quizdashboard_controller.dart';

class QuizdashboardView extends GetView<QuizdashboardController> {
  const QuizdashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    controller.context = context;
    return Scaffold(
      appBar: CustomAppBar(
        // title: MemoryManagement.getUserName() == null
        //     ? ""
        //     : MemoryManagement.getUserName()!,
        title: "",
        statusBarColor: AppColors.backgroundColor3,
        titleStyle: Get.theme.textTheme.headline2!,
        leadingIcon: Icons.logout,
        onleadingPress: () {
          controller.logout();
        },
      ),
      //appBar: const EmptyAppBar(statusBarColor: AppColors.backgroundColor3),
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
              SizedBox(
                height: 50.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GetBuilder<QuizdashboardController>(
                  builder: (_) {
                    return Wrap(
                      spacing: 15.w,
                      runSpacing: 15.h,
                      children: List.generate(
                        controller.quizData.length,
                        (index) {
                          var dashitem = controller.quizData[index];
                          return DashboardItem(
                            quizName: dashitem.quiz!,
                            quizID: dashitem.id!.toString(),
                            onClick: () {
                              print(dashitem);
                              //Get.toNamed(Routes.QUESTIONS);
                              /// Get.toNamed(Routes.LOGIN);
                              Get.toNamed(Routes.QUESTIONS,
                                  arguments: {"data": dashitem});
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
