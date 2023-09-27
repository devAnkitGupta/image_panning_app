class UploadPictureResponse {
  UploadPictureResponse({
    required this.success,
    required this.isAuth,
    required this.message,
    required this.result,
  });
  late final bool success;
  late final bool isAuth;
  late final String message;
  late final List<UploadPictureResponseData> result;

  UploadPictureResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    isAuth = json['isAuth'];
    message = json['message'];
    result = List.from(json['result'])
        .map((e) => UploadPictureResponseData.fromJson(e))
        .toList();
  }
}

class UploadPictureResponseData {
  UploadPictureResponseData({
    required this.uid,
    required this.profileBannerImageURL,
  });
  late final String uid;
  late final String profileBannerImageURL;

  UploadPictureResponseData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    profileBannerImageURL = json['profileBannerImageURL'];
  }
}
