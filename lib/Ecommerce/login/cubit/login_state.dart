part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class EyeIsChanged extends LoginState {}
