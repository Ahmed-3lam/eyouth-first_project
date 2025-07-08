import 'package:first_project/Ecommerce/const.dart';
import 'package:first_project/Ecommerce/helpers/common_widgets/custom_btn.dart';
import 'package:first_project/Ecommerce/login/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Rebuild =========");
    return Scaffold(
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
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
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
                      CustomTextField(),
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
                customBtn(
                    text: "Login",
                    color: Colors.green,
                    textColor: Colors.white,
                    onTap: () {
                      _formKey.currentState!.validate();
                    }),
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
                      onPressed: () {},
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
