part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}
//send verification loading
final class SendVerificationLoading extends OtpState {}
final class SendVerificationSuccess extends OtpState {
  List<int>?data;
  SendVerificationSuccess(this.data);
}
final class SendVerificationFailure extends OtpState {

  String error;
  SendVerificationFailure(this.error);

}
final class VerifyAccountLoading extends OtpState {}

final class VerifyAccountSuccess extends OtpState {
  VerifyAccount ?data;
  VerifyAccountSuccess(this.data);
}
final class VerifyAccountFailure extends OtpState {

  String? error;
  VerifyAccountFailure(this.error);

}


final class ForgetPassLoading extends OtpState {}

final class ForgetPassSuccess extends OtpState {
  ForgetPasswordModel ?data;
  ForgetPassSuccess(this.data);
}
final class ForgetPassFailure extends OtpState {

  String? error;
  ForgetPassFailure(this.error);

}