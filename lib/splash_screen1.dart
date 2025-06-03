import 'dart:async';

import 'package:first_project/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen1 extends StatefulWidget {
  SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  void _startTimer() {
    print("First Print");
    Future.delayed(Duration(seconds: 5)).then((value) {
      Get.to(SplashScreen2());
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40AA54),
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 80,
        ),
      ),
    );
  }
}
