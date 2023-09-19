
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/app/theme/app_color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.iconLocation,
  });

  final String label;
  final VoidCallback onTap;
  final String iconLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50.h,
            width: 50.h,
            margin: EdgeInsets.only(bottom: 6.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.borderGrey,
              ),
            ),
            child: Image.asset(
              iconLocation,
              height: 24.w,
              width: 24.w,
            ),
          ),
        ),
        Text(label)
      ],
    );
  }
}
