import 'package:flutter/material.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/view/widgets/loading_indicator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    moveToChangeDesign();
  }

  Future<void> moveToChangeDesign() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacementNamed(RouteConstants.changeDesign);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingIndicator(),
      ),
    );
  }
}


