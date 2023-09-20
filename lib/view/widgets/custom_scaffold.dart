import 'package:flutter/material.dart';
import 'package:image_panning_app/constants/app_strings.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.backgroundColor,
  });

  final String title;
  final Widget body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(title),
        leading: Image.asset(
          '${AppStrings.assestsLocation}arrow_back.png',
        ),
      ),
      body: Center(child: body),
    );
  }
}
