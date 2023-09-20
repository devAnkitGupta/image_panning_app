import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';
import 'package:image_panning_app/view/widgets/user_profile_info.dart';

class CustomImageCardScreen extends StatelessWidget {
  const CustomImageCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Custom Image Card',
      backgroundColor: AppColor.grey10,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
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
                  UserProfileInfo(
                    enableEditing: true,
                    onEditingTapped: () {
                      Navigator.pushNamed(
                        context,
                        RouteConstants.customizeYourCardScreen,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Save'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
