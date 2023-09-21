import 'package:flutter/material.dart';

class LoadingNotifier with ChangeNotifier {
  bool loading = false;

  void startLoading() {
    if (!loading) {
      loading = true;
      notifyListeners();
    }
  }

  void stopLoading() {
    if (loading) {
      loading = false;
      notifyListeners();
    }
  }
}
