import 'package:flutter/material.dart';

class AppLoadingController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void show() {
    _isLoading = true;
    notifyListeners();
  }

  void hide() {
    _isLoading = false;
    notifyListeners();
  }
}
