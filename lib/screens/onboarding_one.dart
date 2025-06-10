import 'package:first_project/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({super.key});

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  int number = 1;
  bool canPop = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (value, _) {
        print(value);
        if (!value) {
          if (number > 1) {
            number--;
          } else {
            canPop = true;
          }
          setState(() {});
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 143,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Container(
                  height: 360,
                  child: Image.asset("${imagesPath}onboarding_$number.png")),
              SizedBox(
                height: 80,
              ),
              Text(
                titles[number - 1],
                style: TextStyle(
                  color: Color(0xFF16162E),
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                descriptions[number - 1],
                style: TextStyle(
                  color: Color(0xFF16162E),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  if (number < 3) {
                    number++;
                    setState(() {});
                  } else {
                    Get.off(AuthScreen());
                  }
                },
                child: Image.asset(
                  "${imagesPath}next_$number.png",
                  height: 88,
                  width: 88,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> titles = [
  "Browse all the category",
  "Amazing Discounts & Offers",
  "Delivery in 30 Min"
];

List<String> descriptions = [
  "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
  "Amazing Discounts & Offers",
  "Delivery in 30 Min"
];
