import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/utils/theme/colors.dart';
import 'package:get/get.dart';

class DashboardItem extends StatelessWidget {
  final String quizName;
  final String quizID;
  final Function onClick;
  const DashboardItem(
      {super.key,
      required this.quizName,
      required this.quizID,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: AppColors.orangeColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(14.0.sp),
          child: Text(
            quizName,
            style: Get.theme.textTheme.button,
          ),
        ),
      ),
    );
  }
}
