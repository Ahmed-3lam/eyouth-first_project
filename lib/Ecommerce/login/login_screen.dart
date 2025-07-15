import 'package:first_project/Ecommerce/const.dart';
import 'package:first_project/Ecommerce/helpers/common_widgets/custom_btn.dart';
import 'package:first_project/Ecommerce/home/main_screen.dart';
import 'package:first_project/Ecommerce/login/cubit/login_cubit.dart';
import 'package:first_project/Ecommerce/login/widget/custom_text_field.dart';
import 'package:first_project/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Get.snackbar("Success State", "success",
              backgroundColor: Colors.green);
          Get.to(MainScreen());
        }
        if (state is LoginErrorState) {
          Get.snackbar("Error State", "Error", backgroundColor: Colors.red);
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      child: Image.asset("${imagesPath}cart_logo.png")),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email"),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                            controller: _emailContoller,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.length < 10) {
                                return "The email letters should be more than 10 letters";
                              } else if (!value.contains(".com")) {
                                return "Email Should contain .com";
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(_passwordContoller),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget Password?"),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return CircularProgressIndicator();
                      }
                      return customBtn(
                          text: "Login",
                          color: Colors.green,
                          textColor: Colors.white,
                          onTap: () {
                            _formKey.currentState!.validate();
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                    email: _emailContoller.text,
                                    password: _passwordContoller.text,
                                  );
                            }
                          });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      _socialbtn(
                        text: "Google",
                        imagePath: "google_icon",
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      _socialbtn(
                        text: "Apple",
                        imagePath: "apple_icon",
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialbtn(
      {required String text, required String imagePath, required Color color}) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 56,
        width: 170,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            border: Border.all(
              color: color,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Image.asset(
              imagesPath + imagePath + ".png",
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
