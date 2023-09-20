import 'dart:io';

import 'package:image_panning_app/model/models/upload_picture_response.dart';
import 'package:image_panning_app/service/service_request.dart';
import 'package:image_panning_app/service/url.dart';

class UploadPictureRepository {
  final ServiceRequest _serviceRequest;
  UploadPictureRepository({
    required ServiceRequest serviceRequest,
  }) : _serviceRequest = serviceRequest;

  Future<UploadPictureResponseData> uploadPicture(File file) async {
   final result =  await _serviceRequest.uploadImage(Urls.postProfileBannerImage, file);
   final uploadPictureResponse = UploadPictureResponse.fromJson(result.data);
   return uploadPictureResponse.result[0];
  }

  Future<void> sendSelectedCardDesignDetails() async {
    _serviceRequest.post(Urls.selectedCardDesignDetails, data: {});
  }
}
