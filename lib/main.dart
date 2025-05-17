import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Image.network(
              "https://img.freepik.com/free-vector/login-concept-illustration_114360-739.jpg",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Hello",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Welcome to my App, You will be happy of it",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent,),
                borderRadius: BorderRadius.circular(30),
              ),
              height: 50,
              width: 250,
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}



