import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_project/Ecommerce/helpers/ecommerce_hive_helper.dart';
import 'package:first_project/Ecommerce/helpers/network/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isObscure = true;

  void toggleEye() {
    isObscure = !isObscure;
    emit(EyeIsChanged());
  }

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await DioHelper.postData("login", body: {
      "email": email,
      "password": password,
    });
    log("-------------response -----------");
    // log("result is: ${result.data}");

    if (result.data["status_code"] == 200) {
      print("My Token is ${result.data["data"]["token"]}");
      EcommerceHiveHelper.setToken(result.data["data"]["token"]);
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }
}
