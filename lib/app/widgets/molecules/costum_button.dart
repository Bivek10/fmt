import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/utils/theme/colors.dart';
import 'package:get/get.dart';

class CostumButton extends StatelessWidget {
  const CostumButton(
      {super.key, required this.btnName, required this.btnEvent});
  final String btnName;
  final VoidCallback btnEvent;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
      width: 120.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: () {
          btnEvent();
        },
        style: ButtonStyle(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
        ),
        child: Text(
          btnName,
          style: Get.theme.textTheme.button,
        ),
      ),
    );
  }
}
