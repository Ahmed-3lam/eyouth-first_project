import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isObscure = true;

  void toggleEye() {
    isObscure = !isObscure;
    emit(EyeIsChanged());
  }
}
