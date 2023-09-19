import 'package:get_it/get_it.dart';
import 'package:image_panning_app/model/repository/upload_picture_repository.dart';
import 'package:image_panning_app/service/api_client.dart';
import 'package:image_panning_app/service/service_request.dart';

class Di {
  static final getIt = GetIt.instance;

  void setUp() {
    /// Register Singleton
    getIt.registerSingleton<ApiClient>(ApiClient());
    getIt.registerSingleton<ServiceRequest>(ServiceRequest(getIt<ApiClient>()));

    /// Register Factory
    getIt.registerFactory<UploadPictureRepository>(
        () => UploadPictureRepository(serviceRequest: getIt<ServiceRequest>()));
  }
}
