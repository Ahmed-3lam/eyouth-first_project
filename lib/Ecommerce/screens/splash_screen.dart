import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var color = Colors.white;
  var imagePath = "assets/images/logo_2.png";
  Timer? _timer;
  int _start = 4;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            // push
            // Replacement
            Get.off(OnboardingOne());
          });
        } else {
          setState(() {
            _start--;
          });
          _changeTheme();
        }
      },
    );
  }

  _changeTheme() {
    if (color == Colors.green) {
      color = Colors.white;
      imagePath = "assets/images/logo_2.png";
    } else {
      color = Colors.green;
      imagePath = "assets/images/logo.png";
    }
    setState(() {});
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Image.asset(
          imagePath,
          height: 80,
        ),
      ),
    );
  }
}
