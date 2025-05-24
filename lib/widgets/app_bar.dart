import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.white,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    leading: Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(avatarImage1),
      ),
    ),
    title: Text(
      "Chats",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    actions: [
      CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.camera_alt_outlined),
      ),
      SizedBox(width: 20,),
      CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.pending_outlined),
      ),
      SizedBox(width: 20,),

    ],
  );
}