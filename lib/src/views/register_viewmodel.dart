import 'package:app/src/services/app_navigator.dart';
import 'package:app/src/widgets/snackbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  String _error = '';

  String get error => _error;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _email = '';

  String get email => _email;

  String _password = '';

  String get password => _password;

  String _passwordConfirm = '';

  String get passwordConfirm => _passwordConfirm;

  bool get isValid =>
      _email.contains('.com') &&
      _password.length > 5 &&
      _password == _passwordConfirm;

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  setPasswordConfirm(String passwordConfirm) {
    _passwordConfirm = passwordConfirm;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setError(String error) {
    _error = error;
    notifyListeners();
  }

  Future<UserCredential?> register() async {
    setIsLoading(true);

    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.trim(),
        password: _password.trim(),
      );
      setIsLoading(false);
      return user;
    } on FirebaseAuthException catch (e) {
      setIsLoading(false);
      setError(e.toString());
      return null;
    }
  }
}
