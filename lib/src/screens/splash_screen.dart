import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () {
        if (FirebaseAuth.instance.currentUser?.uid != null) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'lib/src/assets/login_image.jpg',
              width: 357,
              height: 292,
            ),
          ),
          CircularProgressIndicator(
            color: Color(0XFFE99A01),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
