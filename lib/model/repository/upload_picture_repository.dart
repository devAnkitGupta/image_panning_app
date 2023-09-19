import 'dart:io';

import 'package:image_panning_app/service/service_request.dart';
import 'package:image_panning_app/service/url.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';

class UploadPictureRepository {
  final ServiceRequest _serviceRequest;
  final LoadingNotifier _loadingNotifier;
  UploadPictureRepository({
    required ServiceRequest serviceRequest,
    required LoadingNotifier loadingNotifier,
  })  : _serviceRequest = serviceRequest,
        _loadingNotifier = loadingNotifier;

  Future<void> uploadPicture(File file) async {
    try {
      _loadingNotifier.startLoading();

      await _serviceRequest.uploadImage(Urls.postProfileBannerImage, file);
    } catch (e, _) {
    } finally {
      _loadingNotifier.stopLoading();
    }
  }

  Future<void> sendSelectedCardDesignDetails() async {
    try {
      _loadingNotifier.startLoading();
      _serviceRequest.post(Urls.selectedCardDesignDetails, data: {});
    } catch (e, _) {
    } finally {
      _loadingNotifier.stopLoading();
    }
  }
}
