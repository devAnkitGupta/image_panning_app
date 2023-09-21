import 'package:flutter/material.dart';
import 'package:image_panning_app/view/app/theme/app_color.dart';
import 'package:image_panning_app/view/widgets/loading/loading_notifier.dart';
import 'package:image_panning_app/view/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingNotifier>(
      builder: (context, snapshot, child) {
        return snapshot.loading ? child! : const SizedBox();
      },
      child: Center(
        child: AbsorbPointer(
          child: Container(
            color: AppColor.black.withOpacity(0.5),
            child: const Center(
              child: LoadingIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
