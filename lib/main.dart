import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'Note App/note_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///(1) init hive
  await Hive.initFlutter();

  /// I need box to save my data
  await Hive.openBox("box1");
  var box1 = Hive.box("box1");

  /// To save data (key,value)
  box1.put("Name", "Mohamed");

  /// to get your data
  var name = box1.get("Name");
  print(name);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteScreen(),
    );
  }
}
