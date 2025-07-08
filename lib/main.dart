import 'package:first_project/Ecommerce/helpers/ecommerce_hive_helper.dart';
import 'package:first_project/Ecommerce/login/cubit/login_cubit.dart';
import 'package:first_project/Ecommerce/splash/splash_screen.dart';
import 'package:first_project/signup/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'Ecommerce/helpers/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(EcommerceHiveHelper.onboardingBox);
  DioHelper.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: GetMaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
