import 'package:flutter/material.dart';

class RootProvider with ChangeNotifier {
  int _currentIndex = 0;
  String _cameraImagePath;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setCameraImagePath(String cameraImagePath) {
    _cameraImagePath = cameraImagePath;
    notifyListeners();
  }

  int get getIndex => _currentIndex;
  String get getCameraImagePath => _cameraImagePath;

  @override
  void dispose() {
    super.dispose();
  }
}
