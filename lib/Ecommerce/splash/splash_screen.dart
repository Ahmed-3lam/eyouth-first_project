import 'dart:async';

import 'package:first_project/Ecommerce/auth/auth_screen.dart';
import 'package:first_project/Ecommerce/helpers/ecommerce_hive_helper.dart';
import 'package:first_project/Ecommerce/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../onboarding/onboarding_one.dart';

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
            if (Hive.box(EcommerceHiveHelper.onboardingBox).isEmpty) {
              Get.off(OnboardingOne());
            } else if (Hive.box(EcommerceHiveHelper.token_box).isNotEmpty) {
              Get.off(HomeScreen());
            } else {
              Get.off(AuthScreen());
            }
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
