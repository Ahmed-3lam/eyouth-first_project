import 'package:bloc/bloc.dart';
import 'package:first_project/Ecommerce/helpers/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    final result = await DioHelper.postData("register", body: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });
    if (result.data["status_code"] < 300) {
      Get.snackbar(result.data["message"], "success",
          backgroundColor: Colors.green);
      emit(SignUpSuccessState());
    } else {
      print(result.data["message"]);
      Get.snackbar(result.data["message"], "Error",
          backgroundColor: Colors.red);

      emit(SignUpErrorState());
    }
  }
}
