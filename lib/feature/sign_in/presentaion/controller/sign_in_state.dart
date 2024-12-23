part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}
final class SignInSuccess extends SignInState {}
final class SignInError extends SignInState {
  String errorMessage;
  SignInError({required this.errorMessage});
}


final class SetPasswordLoading extends SignInState {}
final class SetPasswordSuccess extends SignInState {}
final class SetPasswordError extends SignInState {
  String errorMessage;
  SetPasswordError({required this.errorMessage});

}
