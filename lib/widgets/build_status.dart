import 'package:flutter/material.dart';

import '../constants.dart';

Widget buildStatus() {
  return Stack(
    children: [
      CircleAvatar(
        radius: 30,
        child: Container(
          height: 40,
          child: Image.network(
            avatarImage1,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        right: 1,
        bottom: 40,
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white,
        ),
      ),
      Positioned(
        right: 1,
        bottom: 40,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.green,
        ),
      )
    ],
  );
}