part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSuccess extends SignUpState {
  RegisterDataModel registerDataModel;

  SignUpSuccess(this.registerDataModel);

}
final class SignUpFailure extends SignUpState {
  String message;
  SignUpFailure(this.message);
}
final class ValidateLoading extends SignUpState {}
final class ValidateFailure extends SignUpState {
  String message;
  ValidateFailure(this.message);

}