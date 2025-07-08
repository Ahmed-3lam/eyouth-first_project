import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_project/Ecommerce/helpers/dio_helper.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final result = await DioHelper.postData("register", body: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": password,
      "role": "patient"
    });
    log("----------------- Response -----------------");
    log("result is: $result");
  }
}
