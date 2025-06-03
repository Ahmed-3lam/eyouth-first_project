import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  var color = Colors.white;
  var imagePath = "assets/images/logo_2.png";

  void startTimer() {
    const oneSec = const Duration(milliseconds: 300);
    var time = Timer.periodic(oneSec, (Timer t) => _changeTheme());
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
