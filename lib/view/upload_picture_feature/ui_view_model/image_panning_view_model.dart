import 'dart:io';

import 'package:cropperx/cropperx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/utils/utils.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';
import 'package:path_provider/path_provider.dart';

class ImagePanningViewModel with ChangeNotifier {
  final LoadingNotifier _loadingNotifier;

  Image? originalState;
  File? originalImageFile;
  Uint8List? originalbytes;
  bool isPannedRecently = false;

  ImagePanningViewModel({required LoadingNotifier loadingNotifier})
      : _loadingNotifier = loadingNotifier;

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
    } catch (e) {
      Utils.showErrorToast(message: "Editing Failed");
    } finally {
      _loadingNotifier.stopLoading();
    }
    notifyListeners();
  }

  Future<void> setNewCroppedImage(Uint8List bytes) async {
    try {
      originalState = Image.memory(
        bytes,
        width: 335.w,
        height: 700.h,
        fit: BoxFit.cover,
      );
      notifyListeners();
      originalImageFile = await convertImageToFile(bytes);
    } catch (e) {
      Utils.showErrorToast(message: AppStrings.failedToCropImage);
    }
  }

  Future<File> convertImageToFile(Uint8List imageBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final pathOfImage =
        await File('${directory.path}/${imageBytes.hashCode}_artist.png')
            .create();
    final file = await pathOfImage.writeAsBytes(imageBytes);
    return file;
  }

  void onImageReplaced(String imagePath) {
    isPannedRecently = true;
    notifyListeners();
  }

  void setPannedTrue() {
    isPannedRecently = true;
  }

  void resetImageState() {
    originalState = null;
    originalImageFile = null;
  }

  void onSave(GlobalKey cropperKey) async {
    try {
      if (isPannedRecently) {
        final imageBytes = await Cropper.crop(
          cropperKey: cropperKey, // Reference it through the key
        );
        if (imageBytes != null) {
          await setNewCroppedImage(
            imageBytes,
          );
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
