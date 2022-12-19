import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/utils/theme/colors.dart';
import 'package:get/get.dart';

class InputFieldLable extends StatelessWidget {
  const InputFieldLable(
      {super.key, required this.child, this.required, this.lable});
  final Widget child;
  final bool? required;
  final String? lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (lable != null)
          Wrap(
            runSpacing: 8.h,
            spacing: 2.w,
            children: [
              Text(lable ?? '', style: Get.theme.textTheme.caption),
              SizedBox(
                width: 2.w,
              ),
              if (required == true)
                Text(
                  "*",
                  style: Get.theme.textTheme.caption!.copyWith(
                    color: AppColors.errorColor,
                  ),
                ),
              child,
            ],
          ),
      ],
    );
    ;
  }
}
