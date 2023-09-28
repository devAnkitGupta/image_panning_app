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
    if (mounted) {
      Future.microtask(() => imagePanningViewModel.setCropper());
    }
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                ),
                _buildTopBar(
                  context,
                ),
                _buildReplaceImageDottedContainer(
                  context,
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildPanAndZoomArea(),
              ],
            ),
          ),
          _buildSaveButton(context),
        ],
      ),
    );
  }

  Align _buildSaveButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        width: MediaQuery.sizeOf(context).width,
        color: AppColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: ElevatedButton(
            onPressed: () async {
              final isSaved = await imagePanningViewModel.onSave();
              if (isSaved && mounted) {
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ),
      ),
    );
  }

  Widget _buildPanAndZoomArea() {
    return SizedBox(
      height: 600.h,
      child: AspectRatio(
        aspectRatio: ImageConstants.aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            5.r,
          ),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Consumer<ImagePanningViewModel>(
                builder: (context, snapshot, _) {
                  return snapshot.imageCropperWidget;
                },
              ),
              IgnorePointer(
                child: Container(
                  color: AppColor.black54,
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
      ),
    );
  }

  Padding _buildReplaceImageDottedContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 12.w,
        left: 16.w,
        right: 16.w,
      ),
      child: GestureDetector(
        onTap: () => Utils.showPickerModel(
          context,
          openPicker,
        ),
        child: DottedBorder(
          color: AppColor.borderGrey,
          strokeWidth: 1,
          dashPattern: const [2, 2],
          strokeCap: StrokeCap.round,
          radius: Radius.circular(8.r),
          child: Container(
            height: 51.h,
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: AppColor.cardBlue,
              borderRadius: BorderRadius.circular(
                8.r,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '${AppStrings.assestsLocation}photo.png',
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Text(
                  'Change picture here and adjust',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildTopBar(BuildContext context) {
    return Container(
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
              if (mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
