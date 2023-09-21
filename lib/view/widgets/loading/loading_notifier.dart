import 'package:flutter/material.dart';

class LoadingNotifier with ChangeNotifier {
  bool loading = false;

  void startLoading() {
    if (!loading) {
      Future.microtask(() {
        loading = true;
        notifyListeners();
      });
    }
  }

  void stopLoading() {
    if (loading) {
      Future.microtask(() {
        loading = false;
        notifyListeners();
      });
    }
  }
}
