part of 'set_new_password_cubit.dart';

@immutable
sealed class SetNewPasswordState {}

final class SetNewPasswordInitial extends SetNewPasswordState {}

final class SetNewPasswordLoading extends SetNewPasswordState {}
final class SetNewPasswordSuccess extends SetNewPasswordState {}
final class SetNewPasswordError extends SetNewPasswordState {
  final String message;
  SetNewPasswordError({required this.message});


}
final class SetNewPasswordValidateLoading extends SetNewPasswordState {}
final class SetNewPasswordValidateSuccess extends SetNewPasswordState {}
final class SetNewPasswordValidateError extends SetNewPasswordState {}


