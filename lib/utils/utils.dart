import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/widgets/custom_icon_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static void showClientError(Object object) {
    String message = "";
    if (object is DioException) {
      message = object.toString();
    } else {
      message = 'Something went wrong';
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.red,
      textColor: AppColor.white,
      fontSize: 14.0.sp,
    );
  }

  static void showErrorToast({String message = 'Something went wrong'}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.red,
      textColor: AppColor.white,
      fontSize: 14.0.sp,
    );
  }

  static void showSuccessToast({String message = 'Success'}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.green,
      textColor: AppColor.white,
      fontSize: 14.0.sp,
    );
  }

  static Future<XFile?> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    return image;
  }

  /// Function [cropImage] will return String as a path
  /// Or null
  static Future<String?> cropImage(String imagePath) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath,
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
    if (croppedImage != null) {
      return croppedImage.path;
    }
    return null;
  }

  static Future<void> showPickerModel(
    BuildContext context,
    Future<void> Function(ImageSource source) onTap,
  ) {
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
                  onTap: () {
                    onTap.call(ImageSource.camera);
                  },
                ),
                SizedBox(width: 30.w),
                CustomIconButton(
                  iconLocation: "${AppStrings.assestsLocation}gallery.png",
                  label: 'Gallery',
                  onTap: () {
                    onTap.call(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<File> convertImageToFile(Uint8List imageBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final pathOfImage =
        await File('${directory.path}/${imageBytes.hashCode}_artist.png')
            .create();
    final file = await pathOfImage.writeAsBytes(imageBytes);
    return file;
  }

  static Uint8List convertFileToUint8List(File file) {
    return Uint8List.fromList(file.readAsBytesSync());
  }
}
