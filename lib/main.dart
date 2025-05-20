import 'package:first_project/utils/custom_chat.dart';
import 'package:first_project/utils/my_app_bar.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: getMyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                customChat(
                  myIcon: Icons.lock,
                  text: "Locked Chats",
                ),
                SizedBox(
                  height: 20,
                ),
                customChat(
                  myIcon: Icons.archive,
                  text: "Archived",
                  count: "10",
                ),
                SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < 20; i++) myChatMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myChatMessage() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              avatarImage1,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ahmed Allam",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "My Message ,kjjgfjjgfgfg",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          Text("11:00 PM")
        ],
      ),
    );
  }
}
