import 'package:appfyp/enum.dart';
import 'package:flutter/material.dart';

class BasePresenter with ChangeNotifier {
  ViewState state;
  String key;

  void setViewState(ViewState _state) {
    state = _state;
    notifyListeners();
  }

  ViewState get theViewState => state;
}
