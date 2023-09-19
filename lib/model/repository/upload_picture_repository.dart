import 'dart:io';

import 'package:image_panning_app/service/service_request.dart';
import 'package:image_panning_app/service/url.dart';

class UploadPictureRepository {
  final ServiceRequest _serviceRequest;

  UploadPictureRepository({
    required ServiceRequest serviceRequest,
  }) : _serviceRequest = serviceRequest;

  Future<void> uploadPicture(File file) async {
    try {
      _serviceRequest.uploadImage(Urls.postProfileBannerImage, file);
    } catch (e, _) {}
  }

  Future<void> sendSelectedCardDesignDetails() async {
    try {
      _serviceRequest.post(Urls.selectedCardDesignDetails, data: {});
    } catch (e, _) {}
  }
}
