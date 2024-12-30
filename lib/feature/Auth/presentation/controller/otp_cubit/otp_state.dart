part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

//send verification loading
final class SendVerificationLoading extends OtpState {}

class SendVerificationSuccess extends OtpState {
  final List<int>? data;
  SendVerificationSuccess(this.data);
}

class SendVerificationFailure extends OtpState {
  final String error;
  SendVerificationFailure(this.error);
}

final class VerifyAccountLoading extends OtpState {}

class VerifyAccountSuccess extends OtpState {
  final VerifyAccount? data;
  VerifyAccountSuccess(this.data);
}

class VerifyAccountFailure extends OtpState {
  final String? error;
  VerifyAccountFailure(this.error);
}

final class ForgetPassLoading extends OtpState {}

class ForgetPassSuccess extends OtpState {
  final ForgetPasswordModel? data;
  ForgetPassSuccess(this.data);
}

class ForgetPassFailure extends OtpState {
  final String? error;
  ForgetPassFailure(this.error);
}
