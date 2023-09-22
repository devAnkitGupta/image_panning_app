import 'dart:io';

import 'package:cropperx/cropperx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/constants/image_constants.dart';
import 'package:image_panning_app/utils/utils.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';

class ImagePanningViewModel with ChangeNotifier {
  final LoadingNotifier _loadingNotifier;

  /// Original Image saved from url
  Image? originalState;

  /// File to be upload after cropped image is saved
  File? originalImageFile;

  /// for displaying 1st fetched for cropping
  Uint8List? originalbytes;

  /// for displaying replaced Image in cropper
  Uint8List? replacedBytes;

  /// for recording if user have
  /// changed the image after last panned and saved
  bool isPannedRecently = false;

  late Cropper imageCropperWidget;

  final _cropperKey = GlobalKey(debugLabel: 'cropperKey');

  ImagePanningViewModel({required LoadingNotifier loadingNotifier})
      : _loadingNotifier = loadingNotifier;

  void setCropper() {
    if (replacedBytes != null) {
      imageCropperWidget = Cropper(
        aspectRatio: ImageConstants.aspectRatio,
        cropperKey: _cropperKey,
        image: Image.memory(originalbytes!),
        zoomScale: 40,
        onScaleStart: (_) {
          setPannedTrue();
        },
      );
      replacedBytes = null;
      notifyListeners();
    }
  }

  void setInitialImageStates(String url) async {
    try {
      _loadingNotifier.startLoading();
      final ByteData imageData =
          await NetworkAssetBundle(Uri.parse(url)).load("");
      originalbytes = imageData.buffer.asUint8List();
      originalState = Image.memory(
        originalbytes!,
        width: 335.w,
        height: 700.h,
        fit: BoxFit.cover,
      );
      imageCropperWidget = Cropper(
        aspectRatio: ImageConstants.aspectRatio,
        cropperKey: _cropperKey,
        image: Image.memory(originalbytes!),
        zoomScale: 40,
        onScaleStart: (_) {
          setPannedTrue();
        },
      );
    } catch (e) {
      Utils.showErrorToast(message: "Editing Failed");
    } finally {
      _loadingNotifier.stopLoading();
    }
    notifyListeners();
  }

  Future<void> setNewCroppedImage(
    Uint8List croppedBytes,
    Uint8List? replacedBytes,
  ) async {
    try {
      originalState = Image.memory(
        croppedBytes,
        width: 335.w,
        height: 700.h,
        fit: BoxFit.cover,
      );
      notifyListeners();
      if (replacedBytes != null) {
        originalbytes = replacedBytes;
        replacedBytes = null;
      }
      originalImageFile = await Utils.convertImageToFile(croppedBytes);
    } catch (e) {
      Utils.showErrorToast(message: AppStrings.failedToCropImage);
    }
  }

  void onImageReplaced(String imagePath) {
    replacedBytes = Utils.convertFileToUint8List(File(imagePath));
    imageCropperWidget = Cropper(
      aspectRatio: ImageConstants.aspectRatio,
      cropperKey: _cropperKey,
      image: Image.file(File(imagePath)),
      zoomScale: 40,
      onScaleStart: (_) {
        setPannedTrue();
      },
    );
    isPannedRecently = true;
    notifyListeners();
  }

  void setPannedTrue() {
    isPannedRecently = true;
  }

  void resetImagePanningViewModel() {
    originalState = null;
    originalImageFile = null;
    originalbytes = null;
    replacedBytes = null;
    isPannedRecently = false;
  }

  void onSave() async {
    try {
      if (isPannedRecently) {
        final imageBytes = await Cropper.crop(
          cropperKey: _cropperKey, // Reference it through the key
        );
        if (imageBytes != null) {
          await setNewCroppedImage(imageBytes, replacedBytes);
          isPannedRecently = false;
        } else {
          Utils.showErrorToast(message: AppStrings.failedToCropImage);
        }
      }
    } catch (e) {
      Utils.showErrorToast(message: 'Failed To Save');
    }
  }
}
