import 'package:flutter/material.dart';

class LoadingNotifier with ChangeNotifier {
  bool loading = false;

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void stopLoading() {
    loading = false;
    notifyListeners();
  }
}
