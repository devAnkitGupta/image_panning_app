import 'package:flutter/material.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(
      backgroundColor: AppColor.borderGrey,
      valueColor: AlwaysStoppedAnimation(AppColor.red),
    );
  }
}
