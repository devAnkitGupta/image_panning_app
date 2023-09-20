import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';
import 'package:image_panning_app/view/widgets/customize_button.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    super.key,
    this.enableEditing = false,
    this.onEditingTapped,
  });
  final bool enableEditing;
  final VoidCallback? onEditingTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (enableEditing)
          Align(
            alignment: Alignment.topRight,
            child: CustomizeButton(
              callback: onEditingTapped ?? () {},
            ),
          ),
        UserCircularAvatar(
          enableEditing: enableEditing,
        ),
        SizedBox(height: 8.h),
        Text(
          'Nathaniel',
          style: AppTextTheme.headlineSmall.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Stanton',
          style: AppTextTheme.titleLarge.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 24.h),
        if (!enableEditing)
          Text(
            'Realtor | VP design',
            style: AppTextTheme.titleLarge.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        SizedBox(height: 12.h),
        if (!enableEditing)
          Text(
            'Bangalore India',
            style: AppTextTheme.titleLarge.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}

class UserCircularAvatar extends StatelessWidget {
  const UserCircularAvatar({
    super.key,
    this.enableEditing = false,
  });

  final bool enableEditing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.h,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
            ),
            padding: EdgeInsets.all(3.w),
            child: Container(
              height: 100.h,
              width: 100.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(enableEditing
                      ? '${AppStrings.assestsLocation}userProfile.png'
                      : '${AppStrings.assestsLocation}user.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (enableEditing)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
                padding: EdgeInsets.all(2.w),
                child: Container(
                  height: 25.h,
                  width: 25.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.black,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: AppColor.white,
                    size: 16,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
