import 'dart:async';

import 'package:flutter/material.dart';

import '../const.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int imageNumber = 1;

  Timer? _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (imageNumber == 1) {
          imageNumber = 2;
        } else {
          imageNumber = 1;
        }
        setState(() {});
      },
    );
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
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "${imagesPath}background_$imageNumber.png",
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(
              top: 130.0,
              left: 30,
              bottom: 46,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to our  ",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "E-Grocery",
                  style: TextStyle(
                    fontSize: 36,
                    color: Color(0xFF40AA54),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                _authBtn(
                    text: "Continue with Email or Phone",
                    color: Color(0xFF40AA54),
                    textColor: Colors.white),
                SizedBox(
                  height: 20,
                ),
                _authBtn(
                  text: "Create an account",
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _authBtn(
      {required String text, required Color color, required Color textColor}) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
