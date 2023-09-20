import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';

class ImagePanningViewModel with ChangeNotifier {
  final LoadingNotifier _loadingNotifier;

  Image? originalState;
  Image? customizeState;
  File? originalImageFile;

  ImagePanningViewModel({required LoadingNotifier loadingNotifier})
      : _loadingNotifier = loadingNotifier;

  void setInitialImageStates(String url) async {
    try {
      _loadingNotifier.startLoading();
      final ByteData imageData =
          await NetworkAssetBundle(Uri.parse(url)).load("");
      final Uint8List bytes = imageData.buffer.asUint8List();
      originalState = Image.memory(
        bytes,
        width: 335.w,
        height: 638.h,
        fit: BoxFit.cover,
      );
      customizeState = Image.memory(
        bytes,
        width: 335.w,
        height: 600.h,
        fit: BoxFit.cover,
      );
    } catch (e) {
    } finally {
      _loadingNotifier.stopLoading();
    }
    notifyListeners();
  }

  void setNewCroppedImage(Uint8List bytes) {
    originalState = Image.memory(
      bytes,
      width: 335.w,
      height: 638.h,
      fit: BoxFit.cover,
    );

    customizeState = Image.memory(
      bytes,
      width: 335.w,
      height: 600.h,
      fit: BoxFit.cover,
    );
    notifyListeners();
  }

  void resetImageState() {
    originalState = null;
    customizeState = null;
    originalImageFile = null;
  }
}
