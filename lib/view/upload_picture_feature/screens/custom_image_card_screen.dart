import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/image_constants.dart';
import 'package:image_panning_app/utils/utils.dart';
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
          return (snapshot.originalState == null)
              ? const SizedBox()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        height: 700.h,
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: AspectRatio(
                                aspectRatio: ImageConstants.aspectRatio,
                                child: snapshot.originalState,
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
                        onPressed: () async {
                          if (snapshot.originalImageFile != null) {
                            await Provider.of<UploadPictureViewModel>(
                              context,
                              listen: false,
                            ).uploadPicture(
                              snapshot.originalImageFile!,
                            );
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          } else {
                            Utils.showErrorToast(
                              message: "No change in Image Found",
                            );
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
