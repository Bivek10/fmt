import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/utils/theme/colors.dart';

class DashboardItem extends StatelessWidget {
  final String quizName;
  final String quizID;
  const DashboardItem(
      {super.key, required this.quizName, required this.quizID});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(14.r), boxShadow: [
        BoxShadow(
          color: AppColors.blackColor.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
        
      ]),
      child: Text(quizName, style: Text,),
    );
  }
}
