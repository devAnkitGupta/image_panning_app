import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/view/app/route/routes.dart';
import 'package:image_panning_app/view/widgets/loading/loading_screen.dart';
import 'package:image_panning_app/view/splash/splash.dart';
import 'package:image_panning_app/view/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, _) {
        ScreenUtil.init(context, designSize: const Size(375, 768));
        return Stack(
          children: [
            buildApp(),
            const LoadingScreen(),
          ],
        );
      },
    );
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
