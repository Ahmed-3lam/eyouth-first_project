import 'package:first_project/Ecommerce/helpers/ecommerce_hive_helper.dart';
import 'package:first_project/Ecommerce/home/cubit/home_cubit.dart';
import 'package:first_project/Ecommerce/login/cubit/login_cubit.dart';
import 'package:first_project/Ecommerce/splash/splash_screen.dart';
import 'package:first_project/signup/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'Ecommerce/helpers/network/dio_helper.dart';

var locale = Locale("en");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(EcommerceHiveHelper.onboardingBox);
  await Hive.openBox(EcommerceHiveHelper.token_box);
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
        BlocProvider(create: (context) => HomeCubit()..getProfile()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: SplashScreen(),
      ),
    );
  }
}

///
