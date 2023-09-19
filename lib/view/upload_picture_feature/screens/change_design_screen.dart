import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/utils/utils.dart';
import 'package:image_panning_app/view/widgets/custom_icon_button.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';
import 'package:image_panning_app/view/widgets/star_button.dart';
import 'package:image_picker/image_picker.dart';

class ChangeDesignScreen extends StatefulWidget {
  const ChangeDesignScreen({super.key});

  @override
  State<ChangeDesignScreen> createState() => _ChangeDesignScreenState();
}

class _ChangeDesignScreenState extends State<ChangeDesignScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Change design',
      body: _buildBody(context),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        StarButton(
          onTap: () {
            showPickerModel(context);
          },
          title: 'Upload picture',
        ),
      ],
    );
  }

  Future<void> showPickerModel(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 142.h,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  iconLocation: "${AppStrings.assestsLocation}camera.png",
                  label: 'Camera',
                  onTap: () async {
                    await openPicker(ImageSource.camera);
                  },
                ),
                SizedBox(width: 30.w),
                CustomIconButton(
                  iconLocation: "${AppStrings.assestsLocation}gallery.png",
                  label: 'Gallery',
                  onTap: () async {
                    await openPicker(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> openPicker(ImageSource source) async {
    final imageFile = await Utils.getImage(source);
    //TODO: Handle Null SnackBar
    if (context.mounted) {
      Navigator.pop(context);
    }
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      compressFormat: ImageCompressFormat.png,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: AppStrings.editPhoto,
          toolbarColor: AppColor.white,
          toolbarWidgetColor: AppColor.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: AppStrings.editPhoto,
        ),
      ],
    );
    if (croppedFile == null) return;
    if (context.mounted) {
      Navigator.pushNamed(
        context,
        RouteConstants.uploadPictureScreen,
        arguments: croppedFile.path,
      );
    }
  }
}
