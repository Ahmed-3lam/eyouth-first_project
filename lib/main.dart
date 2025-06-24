import 'package:first_project/Note%20App/helpers/hive_helper.dart';
import 'package:first_project/counter/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'counter/counter_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.NOTE_BOX);
  await HiveHelper.getAllNotes();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //(2) Bloc Provider to provide counter cubit
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    );
  }
}
