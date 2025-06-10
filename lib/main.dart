import 'package:first_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  printMyName3();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
    );
  }
}

Future<void> printMyName1() async {
  await Future.delayed(Duration(seconds: 5));
  print("===============");
  print("Ahmed(1)");
  print("===============");
}

Future<void> printMyName2() async {
  await Future.delayed(Duration(seconds: 3));

  print("===============");
  print("Ahmed(2)");
  print("===============");
}

void printMyName3() {
  print("===============");
  print("Ahmed(3)");
  print("===============");
}
