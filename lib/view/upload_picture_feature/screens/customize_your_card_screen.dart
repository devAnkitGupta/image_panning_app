import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';
import 'package:image_panning_app/view/widgets/user_profile_info.dart';

class CustomizeYourCardScreen extends StatelessWidget {
  const CustomizeYourCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Customize Your Card',
                        style: AppTextTheme.bodyMedium,
                      ),
                      GestureDetector(
                        child: Image.asset(
                          '${AppStrings.assestsLocation}cross.png',
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                DottedBorder(
                  color: AppColor.borderGrey,
                  strokeWidth: 1,
                  dashPattern: const [2, 2],
                  strokeCap: StrokeCap.round,
                  radius: Radius.circular(8.r),
                  child: Container(
                    height: 51.h,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColor.cardBlue,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('${AppStrings.assestsLocation}photo.png'),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text('Change picture here and adjust'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 335.w,
                  height: 638.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          '${AppStrings.assestsLocation}user.jpeg',
                          width: 335.w,
                          height: 638.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 60.h,
                        child: const UserProfileInfo(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
