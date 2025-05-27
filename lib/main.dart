import 'package:flutter/cupertino.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            CupertinoIcons.left_chevron,
            color: Colors.grey,
          ),
          title: Text(
            "My Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 30,
              ),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _header(),
                SizedBox(
                  height: 70,
                ),
                _buildSettingItem(icon: Icons.favorite, text: "Favourites"),
                _buildSettingItem(icon: Icons.archive, text: "Download"),
                Divider(),
                _buildSettingItem(icon: Icons.language, text: "Language"),
                _buildSettingItem(icon: Icons.location_on, text: "Location"),
                _buildSettingItem(icon: Icons.wallet, text: "Subscription"),
                Divider(),
                _buildSettingItem(icon: Icons.delete, text: "Clear Cache"),
                _buildSettingItem(icon: Icons.timelapse, text: "Clear history"),
                _buildSettingItem(
                  icon: Icons.logout,
                  text: "Logout",
                  myColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(
      {required IconData icon, required String text, Color? myColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: myColor ?? Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(
            CupertinoIcons.right_chevron,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          // alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(avatarImage2),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Mohamed Alaa",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "mohamed434545@gmail.com",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  color: Colors.green,
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
