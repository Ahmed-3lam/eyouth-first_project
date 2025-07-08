import 'package:bloc/bloc.dart';
import 'package:first_project/Ecommerce/helpers/dio_helper.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isObscure = true;

  void toggleEye() {
    isObscure = !isObscure;
    emit(EyeIsChanged());
  }

  void login({required String email, required String password}) async {
    final result = await DioHelper.postData("login", body: {
      "email": email,
      "password": password,
    });
    print(result.toString());
  }
}
