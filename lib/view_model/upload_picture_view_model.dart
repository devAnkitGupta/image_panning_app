import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_panning_app/model/repository/upload_picture_repository.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';

class UploadPictureViewModel with ChangeNotifier {
  final UploadPictureRepository _uploadPictureRepository;
  final LoadingNotifier _loadingNotifier;

  UploadPictureViewModel({
    required UploadPictureRepository uploadPictureRepository,
    required LoadingNotifier loadingNotifier,
  })  : _uploadPictureRepository = uploadPictureRepository,
        _loadingNotifier = loadingNotifier;

  Future<void> uploadPicture(File file) async {
    try {
      _loadingNotifier.startLoading();
      await _uploadPictureRepository.uploadPicture(file);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _loadingNotifier.stopLoading();
    }
  }
}
