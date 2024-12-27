part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginInLoading extends LoginInitial {}
final class LoginInSuccess extends LoginInitial {

}
final class LoginInError extends LoginInitial {
  String errorMessage;
  LoginInError({required this.errorMessage});
}