import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/upload_picture_feature/ui_view_model/image_panning_view_model.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';
import 'package:image_panning_app/view/widgets/user_profile_info.dart';
import 'package:image_panning_app/view_model/upload_picture_view_model.dart';
import 'package:provider/provider.dart';

class CustomImageCardScreen extends StatelessWidget {
  const CustomImageCardScreen({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    Provider.of<ImagePanningViewModel>(context, listen: false)
        .setInitialImageStates(url);
    return CustomScaffold(
      title: 'Custom Image Card',
      backgroundColor: AppColor.grey10,
      body: Consumer<ImagePanningViewModel>(
        builder: (context, snapshot, _) {
          return (snapshot.customizeState == null ||
                  snapshot.originalState == null)
              ? const SizedBox()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: 335.w,
                        height: 638.h,
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: snapshot.originalState,
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
                        onPressed: () async {
                          //TODO
                          if (snapshot.originalImageFile != null) {
                            Provider.of<UploadPictureViewModel>(context)
                                .uploadPicture(File(''));
                          }
                        },
                        child: const Text('Save'),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
