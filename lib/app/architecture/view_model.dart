import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  bool _isBusy = false;
  bool _hasError = false;
  bool get isBusy => _isBusy;
  bool get hasError => _hasError;

  setBusy(bool busy) {
    _isBusy = busy;
    notifyListeners();
  }

  setError(bool error) {
    _hasError = error;
    notifyListeners();
  }
}
