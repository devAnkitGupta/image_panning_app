import 'package:flutter/material.dart';
import 'package:image_panning_app/constants/app_strings.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.backgroundColor,
    this.hasLeading = true,
  });

  final String title;
  final Widget body;
  final Color? backgroundColor;
  final bool hasLeading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(title),
        leading: hasLeading
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  '${AppStrings.assestsLocation}arrow_back.png',
                ),
              )
            : null,
      ),
      body: Center(child: body),
    );
  }
}
