import 'package:app/src/app.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  SnackBar snackbar;
  AppNavigator.snackBar(this.snackbar) {
    ScaffoldMessenger.of(navigationApp.currentContext!).showSnackBar(snackbar);
  }
}
