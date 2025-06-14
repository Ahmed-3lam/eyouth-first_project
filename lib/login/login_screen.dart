import 'dart:io';

import 'package:first_project/home_screen.dart';
import 'package:first_project/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisable = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  File? cameraImage;
  File? galleryImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 150.0,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/logo_2.png"),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !isPasswordVisable,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        isPasswordVisable = !isPasswordVisable;
                        // if (isPasswordVisable) {
                        //   isPasswordVisable = false;
                        // } else {
                        //   isPasswordVisable = true;
                        // }
                        setState(() {});
                      },
                      icon: Icon(
                        isPasswordVisable
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash_fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                color: Colors.green,
                minWidth: 200,
                onPressed: () {
                  LoginController.loginModel.email = _emailController.text;
                  LoginController.loginModel.password =
                      _passwordController.text;
                  Get.to(
                    HomeScreen(),
                  );
                },
                child: Text("Login"),
              ),
              if (cameraImage != null) Image.file(cameraImage!),
              MaterialButton(
                color: Colors.orange,
                minWidth: 200,
                onPressed: () async {
                  cameraImage = await pickImage();

                  setState(() {});
                },
                child: Text("Camera"),
              ),
              if (galleryImage != null) Image.file(galleryImage!),
              MaterialButton(
                color: Colors.blue,
                minWidth: 200,
                onPressed: () async {
                  galleryImage = await pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: Text("Pick Image from Gallery"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<File?> pickImage({
  ImageSource source = ImageSource.camera,
}) async {
  final picker = ImagePicker();
  final result = await picker.pickImage(source: source);
  print("===================${result?.path}");
  if (result?.path != null) {
    final imageFile = File(result!.path);
    return imageFile;
  }
  return null;
}

String getName() {
  return "Ahmed";
}
