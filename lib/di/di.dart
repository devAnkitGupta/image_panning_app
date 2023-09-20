import 'package:get_it/get_it.dart';
import 'package:image_panning_app/model/repository/upload_picture_repository.dart';
import 'package:image_panning_app/service/api_client.dart';
import 'package:image_panning_app/service/service_request.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';
import 'package:image_panning_app/view_model/upload_picture_view_model.dart';

class Di {
  static final getIt = GetIt.instance;

  static void setUp() {
    /// Register Singleton Services
    getIt.registerSingleton<ApiClient>(ApiClient());
    getIt.registerSingleton<ServiceRequest>(ServiceRequest(getIt<ApiClient>()));

    /// Register Widgets Notifer
    getIt.registerSingleton<LoadingNotifier>(LoadingNotifier());

    /// Register Repository
    getIt
        .registerFactory<UploadPictureRepository>(() => UploadPictureRepository(
              serviceRequest: getIt<ServiceRequest>(),
            ));

    /// Register ViewMode
    getIt.registerSingleton<UploadPictureViewModel>(
      UploadPictureViewModel(
        uploadPictureRepository: getIt<UploadPictureRepository>(),
        loadingNotifier: getIt<LoadingNotifier>(),
      ),
    );
  }
}
