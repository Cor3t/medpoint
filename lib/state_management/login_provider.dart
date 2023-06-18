import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool passwordVisibility = true;

  void visibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }
}
