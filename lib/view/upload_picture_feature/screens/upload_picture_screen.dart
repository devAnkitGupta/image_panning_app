import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/app/theme/app_color.dart';
import 'package:image_panning_app/app/theme/app_text_theme.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';

class UploadPictureScreen extends StatelessWidget {
  const UploadPictureScreen({
    super.key,
    required this.pickedFile,
  });

  final String pickedFile;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Upload Picture',
      body: Column(
        children: [
          Container(
            width: 327.w,
            height: 504.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColor.borderGrey,
              image: DecorationImage(
                image: FileImage(
                  File(pickedFile),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Picture ready to be saved',
            style: AppTextTheme.titleMedium,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save & Continue'),
          ),
          const Spacer()
        ],
      ),
    );
  }
}