import 'package:flutter/material.dart';
import 'package:image_panning_app/di/di.dart';
import 'package:image_panning_app/view/app/app.dart';

void main() {
  Di.setUp();
  runApp(const App());
}
