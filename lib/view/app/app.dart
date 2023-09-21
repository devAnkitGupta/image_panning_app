import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/di/di.dart';
import 'package:image_panning_app/view/app/route/routes.dart';
import 'package:image_panning_app/view/upload_picture_feature/ui_view_model/image_panning_view_model.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';
import 'package:image_panning_app/view/widgets/loading/loading_screen.dart';
import 'package:image_panning_app/view/splash/splash.dart';
import 'package:image_panning_app/view/app/theme/app_theme.dart';
import 'package:image_panning_app/view_model/upload_picture_view_model.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Di.getIt<LoadingNotifier>()),
        ChangeNotifierProvider.value(value: Di.getIt<UploadPictureViewModel>()),
        ChangeNotifierProvider.value(value: Di.getIt<ImagePanningViewModel>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, _) {
          return buildFlutterSplash();
        },
      ),
    );
  }

  FutureBuilder<bool> buildFlutterSplash() {
    return FutureBuilder<bool>(
        future: Future.delayed(const Duration(seconds: 1), () => true),
        builder: (context, snapshot) {
          ScreenUtil.init(context, designSize: const Size(375, 768));
          return snapshot.data == true
              ? Stack(
                  children: [
                    buildApp(),
                    const LoadingScreen(),
                  ],
                )
              : const FlutterLogo();
        });
  }

  Widget buildApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme(),
      routes: Routes.getAll(),
      onGenerateRoute: Routes.generateRoute,
      home: const Splash(),
    );
  }
}
