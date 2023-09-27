import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/image_constants.dart';
import 'package:image_panning_app/model/models/upload_picture_response.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';
import 'package:image_panning_app/view/upload_picture_feature/ui_view_model/image_panning_view_model.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';
import 'package:image_panning_app/view/widgets/user_profile_info.dart';
import 'package:image_panning_app/view_model/upload_picture_view_model.dart';
import 'package:provider/provider.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({
    super.key,
    required this.uploadPictureData,
  });

  final UploadPictureResponseData uploadPictureData;

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<UploadPictureViewModel>(
      context,
      listen: false,
    ).getSelectedCardDesignDetails();
  }

  void onEditingTapped(String profileUrl) {
    Provider.of<ImagePanningViewModel>(
      context,
      listen: false,
    ).resetImagePanningViewModel();
    Navigator.pushNamed(
      context,
      RouteConstants.customImageCardScreen,
      arguments: profileUrl,
    ).then(
      (value) => Provider.of<UploadPictureViewModel>(
        context,
        listen: false,
      )
        ..resetProfileImage()
        ..getSelectedCardDesignDetails(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Artist',
      backgroundColor: AppColor.grey10,
      body: Consumer<UploadPictureViewModel>(
        builder: (context, snapshot, _) {
          return snapshot.profileUrl == null
              ? const SizedBox()
              : SingleChildScrollView(
                  child: Column(
                    key: UniqueKey(),
                    children: [
                      SizedBox(height: 24.h),
                      _ArtistCard(url: snapshot.profileUrl!),
                      SizedBox(height: 24.h),
                      OutlinedButton(
                        onPressed: () => onEditingTapped(
                          snapshot.profileUrl!,
                        ),
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
                );
        },
      ),
    );
  }
}

class _ArtistCard extends StatelessWidget {
  const _ArtistCard({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: AspectRatio(
                aspectRatio: ImageConstants.aspectRatio,
                child: _buildNetworkImage(),
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
                    padding: EdgeInsets.all(
                      2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.black54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.r),
                      ),
                    ),
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
      ),
    );
  }

  Image _buildNetworkImage() {
    return Image.network(
      url,
      fit: BoxFit.fill,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation(
              AppColor.red,
            ),
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, exception, stackTrace) {
        return const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: AppColor.red,
            ),
            Text(
              'Failed to load Image',
              style: TextStyle(color: AppColor.red),
            )
          ],
        );
      },
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
      height: size?.h ?? 30.h,
      width: size?.h ?? 30.h,
      margin: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      decoration: BoxDecoration(
        color: AppColor.black54,
        borderRadius: BorderRadius.all(
          Radius.circular(
            6.r,
          ),
        ),
      ),
      child: Icon(
        iconData,
        color: AppColor.white,
        size: iconSize?.h ?? 22.h,
      ),
    );
  }
}
