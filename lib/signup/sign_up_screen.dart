import 'package:first_project/Ecommerce/const.dart';
import 'package:first_project/Ecommerce/helpers/common_widgets/custom_btn.dart';
import 'package:first_project/Ecommerce/login/widget/custom_text_field.dart';
import 'package:first_project/signup/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailContoller = TextEditingController();
  final _nameContoller = TextEditingController();
  final _phoneContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      Text("Name"),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          controller: _nameContoller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Phone"),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          controller: _phoneContoller,
                          keyboardType: TextInputType.phone,
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
                SizedBox(
                  height: 200,
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return customBtn(
                        text: "Sign Up",
                        color: Colors.green,
                        textColor: Colors.white,
                        onTap: () {
                          _formKey.currentState!.validate();
                          if (_formKey.currentState!.validate()) {
                            context.read<SignUpCubit>().signUp(
                                  email: _emailContoller.text,
                                  password: _passwordContoller.text,
                                  name: _nameContoller.text,
                                  phone: _phoneContoller.text,
                                );
                          }
                        });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                ),
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
