import 'package:flutter/material.dart';

class RootProvider with ChangeNotifier {
  int currentIndex = 0;
  String _cameraImagePath;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void setCameraImagePath(String cameraImagePath) {
    _cameraImagePath = cameraImagePath;
    notifyListeners();
  }

  int get getIndex => currentIndex;
  String get getCameraImagePath => _cameraImagePath;

  @override
  void dispose() {
    super.dispose();
  }
}
