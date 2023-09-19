import 'package:flutter/material.dart';
import 'package:image_panning_app/app/route/route_constants.dart';
import 'package:image_panning_app/view/upload_picture_feature/screens/change_design_screen.dart';
import 'package:image_panning_app/view/splash/splash_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        RouteConstants.changeDesign: (context) => const ChangeDesignScreen(),
        RouteConstants.splash: (context) => const Splash(),
      };

  /// Used to route with parameters.

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   late WidgetBuilder builder;
  //   switch (settings.name) {
  //     case RouteConstants.childScreen:
  //     case RouteConstants.formScreen:
  //       builder =
  //            TrackingRoutes.getRoutesWithSettings(settings)[settings.name]!;
  //   }
  //   return MaterialPageRoute(
  //     builder: builder,
  //     settings: settings,
  //   );
  // }
}
