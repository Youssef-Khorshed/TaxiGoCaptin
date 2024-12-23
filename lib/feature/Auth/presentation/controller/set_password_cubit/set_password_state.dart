part of 'set_password_cubit.dart';

@immutable
sealed class SetPasswordState {}

final class SetPasswordInitial extends SetPasswordState {}
final class SetPasswordLoading extends SetPasswordState {}
final class SetPasswordSuccess extends SetPasswordState {}
final class SetPasswordError extends SetPasswordState {
  String errorMessage;
  SetPasswordError({required this.errorMessage});


}
final class SetPasswordValidateLoading extends SetPasswordState {}
final class SetPasswordValidateSuccess extends SetPasswordState {}