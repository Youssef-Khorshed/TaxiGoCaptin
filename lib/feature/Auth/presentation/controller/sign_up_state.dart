part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final RegisterDataModel registerDataModel;

  SignUpSuccess(this.registerDataModel);
}

class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure(this.message);
}

final class ValidateLoading extends SignUpState {}

class ValidateFailure extends SignUpState {
  final String message;
  ValidateFailure(this.message);
}
