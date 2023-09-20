import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({
    super.key,
    required this.callback,
  });

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 110.w,
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 6.h,
        ),
        margin: EdgeInsets.only(
          top: 12.h,
          right: 12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColor.grey10,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.edit,
              color: AppColor.red,
              size: 20,
            ),
            SizedBox(width: 4.w),
            Text(
              'Customize',
              style: AppTextTheme.titleSmall.copyWith(
                color: AppColor.red,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
