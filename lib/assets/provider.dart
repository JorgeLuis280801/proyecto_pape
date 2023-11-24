import 'package:flutter/material.dart';

class ModalValue with ChangeNotifier {
  bool _modal = true;
  bool get theme => _modal;

  void setShowModal(bool value) {
    _modal = value;
    notifyListeners();
  }
}