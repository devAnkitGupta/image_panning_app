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
    try {
      final result = await _serviceRequest.uploadImage(
          Urls.postProfileBannerImage, 'profileBannerImageURL', file);
      final uploadPictureResponse = UploadPictureResponse.fromJson(result.data);
      return uploadPictureResponse.result[0];
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getSelectedCardDesignDetails(String cardId) async {
    try {
      final result = await _serviceRequest.post(
        Urls.selectedCardDesignDetails,
        data: {"cardImageId": cardId},
      );

      /// Since we need only one parameter for our task
      final url = result.data['result'][0]["customImageCardDesignInfo"]
          ["profileBannerImageURL"];
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
