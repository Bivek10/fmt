import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/utils/theme/colors.dart';
import 'package:get/get.dart';

errorMessage({String? message}) {
  Get.showSnackbar(GetSnackBar(
    messageText: Padding(
      padding: EdgeInsets.all(10.h),
      child: Text(
        message!.tr,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16.sp,
        ),
      ),
    ),
    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
    duration: const Duration(seconds: 2),
    backgroundColor: const Color.fromRGBO(252, 239, 237, 0.8999999761581421),
    borderRadius: 8.0,
    snackPosition: SnackPosition.TOP,
    borderColor: AppColors.errorColor,
    icon: const Icon(
      Icons.error,
      color: AppColors.errorColor,
    ),
  ));
}

successMessage({String? message}) {
  Get.showSnackbar(
    GetSnackBar(
      key: const Key("success_message"),
      messageText: Padding(
        padding: EdgeInsets.all(10.h),
        child: Text(
          message!.tr,
          style: TextStyle(
            color: AppColors.sucessColor,
            fontSize: 16.sp,
          ),
        ),
      ),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
      duration: const Duration(seconds: 2),
      backgroundColor: const Color.fromRGBO(252, 239, 237, 0.8999999761581421),
      borderRadius: 8.0,
      snackPosition: SnackPosition.TOP,
      borderColor: AppColors.primaryColor,
      icon: const Icon(
        Icons.check_circle,
        color: AppColors.primaryColor,
      ),
    ),
  );
}
