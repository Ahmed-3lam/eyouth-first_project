import 'package:first_project/login/login_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: [
            Text("My Email is ${LoginController.loginModel.email}"),
            Text("My Password is ${LoginController.loginModel.password} "),
          ],
        ),
      ),
    );
  }
}
