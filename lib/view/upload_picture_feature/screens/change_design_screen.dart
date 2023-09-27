import 'package:flutter/material.dart';
import 'package:image_panning_app/constants/app_strings.dart';
import 'package:image_panning_app/view/app/route/route_constants.dart';
import 'package:image_panning_app/utils/utils.dart';
import 'package:image_panning_app/view/widgets/custom_scaffold.dart';
import 'package:image_panning_app/view/widgets/star_button.dart';
import 'package:image_picker/image_picker.dart';

class ChangeDesignScreen extends StatefulWidget {
  const ChangeDesignScreen({super.key});

  @override
  State<ChangeDesignScreen> createState() => _ChangeDesignScreenState();
}

class _ChangeDesignScreenState extends State<ChangeDesignScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Change design',
      body: _buildBody(context),
      hasLeading: false,
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        StarButton(
          onTap: () {
            Utils.showPickerModel(
              context,
              openPicker,
            );
          },
          title: 'Upload picture',
        ),
      ],
    );
  }

  Future<void> openPicker(ImageSource source) async {
    final imageFile = await Utils.getImage(
      source,
    );
    if (mounted) {
      Navigator.pop(context);
    }
    if (imageFile == null) {
      Utils.showErrorToast(
        message: AppStrings.operationAborted,
      );
      return;
    }
    final croppedFile = await Utils.cropImage(
      imageFile.path,
    );
    if (croppedFile == null) {
      Utils.showErrorToast(
        message: AppStrings.failedToCropImage,
      );
      return;
    }
    if (context.mounted) {
      Navigator.pushNamed(
        context,
        RouteConstants.uploadPictureScreen,
        arguments: croppedFile,
      );
    }
  }
}
