import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/model/models/upload_picture_response.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';
import 'package:image_panning_app/view/widgets/user_profile_info.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({
    super.key,
    required this.uploadPictureData,
  });

  final UploadPictureResponseData uploadPictureData;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Artist',
      backgroundColor: AppColor.grey10,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            _ArtistCard(uploadPictureData: uploadPictureData),
            SizedBox(height: 24.h),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteConstants.customImageCardScreen,
                );
              },
              child: Text(
                'Edit Card',
                style: AppTextTheme.bodyLarge.copyWith(
                  color: AppColor.red,
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class _ArtistCard extends StatelessWidget {
  const _ArtistCard({
    required this.uploadPictureData,
  });

  final UploadPictureResponseData uploadPictureData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      height: 638.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              uploadPictureData.profileBannerImageURL,
              width: 335.w,
              height: 638.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40.h,
            child: const UserProfileInfo(),
          ),
          Positioned(
            bottom: 50.h,
            child: const Row(
              children: [
                _ProfileInfoIcon(
                  iconData: Icons.attach_money_rounded,
                ),
                _ProfileInfoIcon(
                  iconData: Icons.mail,
                ),
                _ProfileInfoIcon(
                  iconData: Icons.phone,
                ),
                _ProfileInfoIcon(
                  iconData: Icons.location_on,
                ),
                _ProfileInfoIcon(
                  iconData: Icons.crisis_alert,
                ),
              ],
            ),
          ),
          Positioned(
            right: 10.w,
            bottom: 10.h,
            child: Row(
              children: [
                const _ProfileInfoIcon(
                  size: 30,
                  iconSize: 22,
                  iconData: Icons.account_circle,
                ),
                Container(
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                      color: AppColor.black54,
                      borderRadius: BorderRadius.all(Radius.circular(4.r))),
                  child: Text(
                    'Profile',
                    style: AppTextTheme.chipLabel,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProfileInfoIcon extends StatelessWidget {
  const _ProfileInfoIcon({
    this.size,
    required this.iconData,
    this.iconSize,
  });

  final int? size;
  final int? iconSize;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?.h ?? 35.h,
      width: size?.h ?? 35.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColor.black54,
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
      ),
      child: Icon(
        iconData,
        color: AppColor.white,
        size: iconSize?.h ?? 26.h,
      ),
    );
  }
}
