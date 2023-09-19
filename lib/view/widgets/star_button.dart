import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/app/theme/app_color.dart';
import 'package:image_panning_app/app/theme/app_text_theme.dart';
import 'package:image_panning_app/constants/app_strings.dart';

class StarButton extends StatelessWidget {
  const StarButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65.h,
        width: 335.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColor.lightBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  '${AppStrings.assestsLocation}star.png',
                ),
              ),
            ),
            Text(
              title,
              style: AppTextTheme.titleSmall.copyWith(
                color: AppColor.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  '${AppStrings.assestsLocation}small_star.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
