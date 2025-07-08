import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_project/Ecommerce/helpers/dio_helper.dart';
import 'package:first_project/Ecommerce/helpers/ecommerce_hive_helper.dart';

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
      log("-------------TOKEN -----------");

      print("My Token is ${result.data["data"]["token"]}");
      EcommerceHiveHelper.setToken(result.data["data"]["token"]);
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }
}

// {
// "status_code": 201,
// "data": {
// "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgsImVtYWlsIjoiZmdmZ2ZnZmdAZXhhbXBsZS5jb20iLCJpYXQiOjE3NTE5OTY4OTIsImV4cCI6MTc1MjA4MzI5Mn0.Q1AAvcRXQktvDhS4lFu6J1wIndzBftf9rOkbAt_aQfg",
// "user": {
// "id": 8,
// "name": "Alice Johnson",
// "email": "fgfgfgfg@example.com",
// "phone": "+1234567892",
// "image": "https://images.unsplash.com/photo-1494790108755-2616b612b789?w=400"
// }
// },
// "message": "Registration successful"
// }
