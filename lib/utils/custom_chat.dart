import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row customChat({
  required IconData? myIcon,
  required String text,
  String? count,
}){
  return Row(
    children: [
      Icon(
        myIcon,
        color: Colors.green,
      ),
      SizedBox(
        width: 15,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      if(count !=null)
        Text(count,style: TextStyle(
            color: Colors.green,fontSize: 18
        ),)
    ],
  );
}