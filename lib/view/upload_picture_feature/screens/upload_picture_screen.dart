import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/image_constants.dart';
import 'package:image_panning_app/utils/utils.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/app/theme/app_text_theme.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';
import 'package:image_panning_app/view_model/upload_picture_view_model.dart';
import 'package:provider/provider.dart';

class UploadPictureScreen extends StatelessWidget {
  const UploadPictureScreen({
    super.key,
    required this.pickedFile,
  });

  final String pickedFile;

  void uploadImage(BuildContext context) async {
    final file = File(pickedFile);
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    if (sizeInMb > 10) {
      Utils.showErrorToast(
        message: 'Images upto 10Mb size can be uploaded',
      );
      return;
    }
    final uploadPictureData = await Provider.of<UploadPictureViewModel>(
      context,
      listen: false,
    ).uploadPicture(file);
    if (uploadPictureData != null) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(
          context,
          RouteConstants.artistScreen,
          arguments: uploadPictureData,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Upload Picture',
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 504.h,
            child: AspectRatio(
              aspectRatio: ImageConstants.aspectRatio,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColor.borderGrey,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: FileImage(
                      File(
                        pickedFile,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Picture ready to be saved',
            style: AppTextTheme.titleMedium,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => uploadImage(
              context,
            ),
            child: const Text(
              'Save & Continue',
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
