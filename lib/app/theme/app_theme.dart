import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_panning_app/app/theme/app_color.dart';
import 'package:image_panning_app/app/theme/app_text_theme.dart';


abstract class AppTheme {
  AppTheme._();

  static ThemeData defaultTheme() => ThemeData(
         primaryColor: AppColor.white,
         scaffoldBackgroundColor: AppColor.white,
        // unselectedWidgetColor: AppColor.white,
        // colorScheme: const ColorScheme.light(
        //   primary: AppColor.primaryColor,
        //   secondary: AppColor.secondaryColor,
        // ),
        appBarTheme:  AppBarTheme(
          color: AppColor.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: AppColor.black,
            size: 24.0,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColor.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: AppTextTheme.titleMedium
        ),
        // fontFamily: AppTextTheme.defaultFontFamily,
        // primaryTextTheme: AppTextTheme.defaultTextTheme(),
        // textTheme: AppTextTheme.defaultTextTheme(),
        // buttonTheme: const ButtonThemeData(
        //   buttonColor: AppColor.primaryColor,
        //   disabledColor: AppColor.grey,
        // ),
        // snackBarTheme: SnackBarThemeData(
        //   backgroundColor: AppColor.white,
        //   actionTextColor: AppColor.black,
        //   disabledActionTextColor: AppColor.grey,
        //   contentTextStyle: AppTextTheme.defaultTextTheme().titleMedium,
        //   elevation: LayoutConstants.noElevation,
        //   behavior: SnackBarBehavior.fixed,
        // ),
      );
}