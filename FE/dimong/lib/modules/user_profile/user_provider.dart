import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  UserCredential? _userCredential;

  UserCredential? get userCredential => _userCredential;

  void setUserCredential(UserCredential? userCredential) {
    _userCredential = userCredential;
    notifyListeners();
  }
}
