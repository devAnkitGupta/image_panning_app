import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_panning_app/app/route/routes.dart';
import 'package:image_panning_app/view/splash/splash_screen.dart';
import 'package:image_panning_app/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, _) {
        ScreenUtil.init(context, designSize: const Size(375, 768));
        return buildApp();
      },
    );
  }

  Widget buildApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme(),
      routes: Routes.getAll(),
      // onGenerateRoute: Routes.generateRoute,
      home: const Splash(),
    );
  }
}
