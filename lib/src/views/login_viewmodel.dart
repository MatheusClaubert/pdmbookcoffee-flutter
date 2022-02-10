import 'package:app/src/services/app_navigator.dart';
import 'package:app/src/widgets/snackbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  String _error = '';

  String get error => _error;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _email = '';

  String get email => _email;

  String _password = '';

  String get password => _password;

  bool get isValid => email.contains('.com') && password.length > 5;

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
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

  Future<UserCredential?> login() async {
    setIsLoading(true);
    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.trim(),
        password: _password.trim(),
      );

      return user;
    } on FirebaseAuthException catch (e) {
      setIsLoading(false);

      setError(e.message.toString());

      return null;
    }
  }
}
