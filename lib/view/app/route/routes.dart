import 'package:flutter/material.dart';
import 'package:image_panning_app/model/models/upload_picture_response.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/upload_picture_feature/screens/artist_screen.dart';
import 'package:image_panning_app/view/upload_picture_feature/screens/change_design_screen.dart';
import 'package:image_panning_app/view/splash/splash.dart';
import 'package:image_panning_app/view/upload_picture_feature/screens/upload_picture_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        RouteConstants.changeDesign: (context) => const ChangeDesignScreen(),
        RouteConstants.splash: (context) => const Splash(),
      };

  /// Used to route with parameters.

  static Route<dynamic> generateRoute(RouteSettings settings) {
    late WidgetBuilder builder;
    switch (settings.name) {
      case RouteConstants.uploadPictureScreen:
      builder = (context){
      final args = settings.arguments! as String;
        return UploadPictureScreen(pickedFile: args);
      };
      case RouteConstants.artistScreen:
      builder = (context) {
        final args = settings.arguments! as UploadPictureResponseData;
        return ArtistScreen(uploadPictureData: args);
      };
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
