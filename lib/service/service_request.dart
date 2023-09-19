import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_panning_app/service/api_client.dart';
import 'package:mime_type/mime_type.dart';

class ServiceRequest {
  final ApiClient _client;

  ServiceRequest(this._client);

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _client.dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> uploadImage(
    String url,
    File file, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    String fileName = file.path.split('/').last;
    String mimeType = mime(fileName) ?? '';
    String mimee = mimeType.split('/')[0];
    String type = mimeType.split('/')[1];

    if (mimeType == '') {
      mimeType = 'image/png';
    }

    FormData formData = FormData.fromMap({
      "profileBannerImageURL": await MultipartFile.fromFile(file.path,
          contentType: MediaType(mimee, type)),
    });

    final response = await _client.dio.post(
      url,
      data: formData,
    );
    return response;
  }
}
