import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_panning_app/model/models/upload_picture_response.dart';
import 'package:image_panning_app/model/repository/upload_picture_repository.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';

class UploadPictureViewModel with ChangeNotifier {
  final UploadPictureRepository _uploadPictureRepository;
  final LoadingNotifier _loadingNotifier;

  ///
  String? profileUrl;

  ///

  UploadPictureViewModel({
    required UploadPictureRepository uploadPictureRepository,
    required LoadingNotifier loadingNotifier,
  })  : _uploadPictureRepository = uploadPictureRepository,
        _loadingNotifier = loadingNotifier;

  /// IF Success function will return [UploadPictureResponseData]
  /// Else function will return null
  Future<UploadPictureResponseData?> uploadPicture(File file) async {
    UploadPictureResponseData? uploadResponseData;
    try {
      _loadingNotifier.startLoading();
      uploadResponseData = await _uploadPictureRepository.uploadPicture(file);
      return uploadResponseData;
    } catch (e) {
      debugPrint(e.toString());
      return uploadResponseData;
    } finally {
      _loadingNotifier.stopLoading();
    }
  }

  /// IF Success function will return [String] as Url for
  /// user Profile Image.
  /// Else function will return null
  Future<void> getSelectedCardDesignDetails(String cardId) async {
    try {
      _loadingNotifier.startLoading();
      profileUrl = await _uploadPictureRepository.getSelectedCardDesignDetails(
        cardId,
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _loadingNotifier.stopLoading();
    }
    notifyListeners();
  }

  void resetProfileImage() {
    profileUrl = null;
    notifyListeners();
  }
}
