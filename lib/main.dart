import 'package:first_project/widgets/app_bar.dart';
import 'package:first_project/widgets/build_status.dart';
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
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
            Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                separatorBuilder: (context, index) =>
                    SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) => buildStatus()),
          ),

          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (c, i) => SizedBox(height: 20,),
              itemBuilder: (context, index) =>
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(avatarImage2),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ahmed Allam", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text("Hello, from EYOUTH " + "." + " 9 min",
                            style: TextStyle(
                              color: Colors.grey,
                            ),),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.check_circle, color: Colors.grey,)
                    ],
                  ),
            ),
          ),


          ],
        ),
      ),
    ),)
    ,
    );
  }


}
