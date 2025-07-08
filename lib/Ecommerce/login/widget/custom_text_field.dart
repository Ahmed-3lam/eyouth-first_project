import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password"),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            validator: (value) {
              if (value!.length < 6) {
                return "Password should be more than 6 letters";
              }
            },
            obscureText: isObscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: InkWell(
                onTap: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                child: Icon(
                  isObscure ? Icons.remove_red_eye : CupertinoIcons.eye_slash,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
