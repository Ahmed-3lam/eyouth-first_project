import 'package:flutter/material.dart';

AppBar getMyAppBar(){
  return AppBar(
    backgroundColor: Colors.green,
    title: Text(
      "WhatsApp",
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      ),
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
      Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}
