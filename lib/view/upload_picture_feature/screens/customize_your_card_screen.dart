import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/constants/image_constants.dart';
import 'package:image_panning_app/utils/utils.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';
import 'package:image_panning_app/view/upload_picture_feature/ui_view_model/image_panning_view_model.dart';
import 'package:image_panning_app/view/widgets/user_profile_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CustomizeYourCardScreen extends StatefulWidget {
  const CustomizeYourCardScreen({super.key});

  @override
  State<CustomizeYourCardScreen> createState() =>
      _CustomizeYourCardScreenState();
}

class _CustomizeYourCardScreenState extends State<CustomizeYourCardScreen> {
  late ImagePanningViewModel imagePanningViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    imagePanningViewModel =
        Provider.of<ImagePanningViewModel>(context, listen: false);
    Future.microtask(() => imagePanningViewModel.setCropper());
  }

  Future<void> openPicker(ImageSource source) async {
    final imageFile = await Utils.getImage(source);
    if (imageFile == null) {
      Utils.showErrorToast(message: AppStrings.operationAborted);
      return;
    }
    imagePanningViewModel.onImageReplaced(imageFile.path);
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 30.h),
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
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 16.w,
                  left: 16.w,
                  right: 16.w,
                ),
                child: GestureDetector(
                  onTap: () => Utils.showPickerModel(context, openPicker),
                  child: DottedBorder(
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
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 335.w,
                height: 600.h,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: AspectRatio(
                        aspectRatio: ImageConstants.aspectRatio,
                        child: Consumer<ImagePanningViewModel>(
                          builder: (context, snapshot, _) {
                            return snapshot.imageCropperWidget;
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60.h,
                      child: const IgnorePointer(
                        child: UserProfileInfo(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: MediaQuery.sizeOf(context).width,
              color: AppColor.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: ElevatedButton(
                  onPressed: () => imagePanningViewModel.onSave(),
                  child: const Text('Save'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
