import 'package:flutter/material.dart';

SnackBar SnackbarWidget({required String title}) => SnackBar(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    backgroundColor: Colors.transparent,
    duration: Duration(seconds: 2),
    content: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      child: Text(title),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
    ));
