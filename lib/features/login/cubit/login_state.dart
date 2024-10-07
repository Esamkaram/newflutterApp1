part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLodingstate extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}
