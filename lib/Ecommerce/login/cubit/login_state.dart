part of 'login_cubit.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class EyeIsChanged extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}
