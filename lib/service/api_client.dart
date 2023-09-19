import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_panning_app/service/exceptions.dart';
import 'package:image_panning_app/service/url.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:ansicolor/ansicolor.dart';

class ApiClient {
  final dio = createDio();

  ApiClient._internal();

  static final _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Urls.baseUrl,
      receiveTimeout: const Duration(seconds: 3), // 15 seconds
      connectTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 3),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          settings: TalkerDioLoggerSettings(
            printRequestData: true,
            printResponseData: true,
            printRequestHeaders: true,
            printResponseHeaders: false,
            printResponseMessage: true,
            errorPen: AnsiPen()..red(),
            requestPen: AnsiPen()..blue(),
            responsePen: AnsiPen()..green(),
          ),
        ),
      );
    }

    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var accessToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiclhnY1Y2YXh3eVRobTNQdE04aGtSaXJTQ2ZsMiIsImlhdCI6MTY5NDAxNzk4NiwiZXhwIjoxNjk1MzEzOTg2fQ.H78KOAS569qre2u0mJY8YWAKzrtzWRRNOJs-PXoOB1E";
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badCertificate:
        throw BadCertificateException(err.requestOptions);
      case DioExceptionType.unknown:
        throw UnknownException(err.requestOptions);
    }

    return handler.next(err);
  }
}
