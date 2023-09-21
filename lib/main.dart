import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_panning_app/di/di.dart';
import 'package:image_panning_app/view/app/app.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  Di.setUp();
  runApp(const App());
}
