import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';

abstract class AppTextTheme {
  AppTextTheme._();

  static const String defaultFontFamily = 'Roboto';

  static final TextStyle displayLarge = TextStyle(
    fontSize: 60.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle displayMedium = TextStyle(
    fontSize: 48.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle displaySmall = TextStyle(
    fontSize: 36.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle headlineMedium = TextStyle(
    fontSize: 32.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle headlineSmall = TextStyle(
    fontSize: 24.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle titleLarge = TextStyle(
    fontSize: 20.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle bodyLarge = TextStyle(
    fontSize: 18.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 16.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle titleMedium = TextStyle(
    fontSize: 16.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle titleSmall = TextStyle(
    fontSize: 14.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle bodySmall = TextStyle(
    fontSize: 14.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle labelSmall = TextStyle(
    fontSize: 12.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle labelLarge = TextStyle(
    fontSize: 14.sp,
    letterSpacing: 1,
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle gradientButtonText = TextStyle(
    fontSize: 18.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle nonButton = TextStyle(
    fontSize: 14.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle appBarTitle = TextStyle(
    fontSize: 16.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextTheme defaultTextTheme() => TextTheme(
        displayLarge: AppTextTheme.displayLarge,
        displayMedium: AppTextTheme.displayMedium,
        displaySmall: AppTextTheme.displaySmall,
        headlineMedium: AppTextTheme.headlineMedium,
        headlineSmall: AppTextTheme.headlineSmall,
        titleLarge: AppTextTheme.titleLarge,
        titleMedium: AppTextTheme.titleMedium,
        titleSmall: AppTextTheme.titleSmall,
        bodyLarge: AppTextTheme.bodyLarge,
        bodyMedium: AppTextTheme.bodyMedium,
        bodySmall: AppTextTheme.bodySmall,
        labelLarge: AppTextTheme.labelLarge,
        labelSmall: AppTextTheme.labelSmall,
      );

  static final TextStyle inputLabelStyle = TextStyle(
    fontSize: 10.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    wordSpacing: 0,
  );

  static final TextStyle inputHintStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    wordSpacing: 0,
  );

  static final TextStyle inputTextStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    wordSpacing: 0,
  );

  static final TextStyle inputHintStyleSecondary = TextStyle(
    fontSize: 12.sp,
    color: AppColor.black,
    fontWeight: FontWeight.normal,
    wordSpacing: 0,
  );

  static final TextStyle inputTextStyleSecondary = TextStyle(
    fontSize: 12.sp,
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    wordSpacing: 0,
  );

  static final TextStyle chipLabel = TextStyle(
    fontSize: 12.sp,
    color: AppColor.white,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle timerWidgetText = TextStyle(
    fontSize: 45.sp,
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );
}