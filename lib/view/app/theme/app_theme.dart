import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData defaultTheme() => ThemeData(
        primaryColor: AppColor.white,
        scaffoldBackgroundColor: AppColor.white,
        appBarTheme: AppBarTheme(
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
          titleTextStyle: AppTextTheme.titleMedium,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColor.white,
        ),
        buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              maximumSize: MaterialStatePropertyAll(Size(335.w, 48.h)),
              minimumSize: MaterialStatePropertyAll(Size(335.w, 48.h)),
              shape: const MaterialStatePropertyAll(
                StadiumBorder(),
              ),
              backgroundColor: const MaterialStatePropertyAll(AppColor.red),
              elevation: const MaterialStatePropertyAll(0.0),
              textStyle:
                  MaterialStatePropertyAll(AppTextTheme.bodyLarge.copyWith(
                color: AppColor.white,
              ))),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            maximumSize: MaterialStatePropertyAll(Size(335.w, 48.h)),
            minimumSize: MaterialStatePropertyAll(Size(335.w, 48.h)),
            shape: const MaterialStatePropertyAll(
              StadiumBorder(),
            ),
            backgroundColor: const MaterialStatePropertyAll(AppColor.white),
            side: const MaterialStatePropertyAll(
              BorderSide(
                width: 1,
                color: AppColor.red,
              ),
            ),
          ),
        ),
      );
}
