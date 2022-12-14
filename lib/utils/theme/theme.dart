import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/utils/theme/colors.dart';

class AppTheme {
  static TextStyle headline1 = TextStyle(
    fontSize: 36.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.primaryColor,
  );

  static TextStyle headline2 = TextStyle(
    fontSize: 18.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.blackColor,
  );

  static TextStyle headline3 = TextStyle(
    fontSize: 18.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.blackColor,
  );

  static TextStyle headline4 = TextStyle(
    fontSize: 16.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.blackColor,
  );

  static TextStyle headline5 = TextStyle(
    fontSize: 14.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.blackColor,
  );

  static TextStyle button = TextStyle(
    fontSize: 14.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.whiteColor,
  );

  static TextStyle labellarge = TextStyle(
    fontSize: 14.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.blackColor,
  );
  static TextStyle labelsmall = TextStyle(
    fontSize: 12.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.blackColor,
  );
  static TextStyle labelmedium = TextStyle(
    fontSize: 12.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.blackColor,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: "Exo2",
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        headline5: headline5,
        labelLarge: labellarge,
        labelSmall: labelsmall,
        labelMedium: labelmedium,
        button: button,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor1,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        titleTextStyle: TextStyle(
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
