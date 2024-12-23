import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/data/repo/otp_repo.dart';

import '../../../data/models/forget_password_model/Forget_password_model.dart';
import '../../../data/models/verify_account/verify_account.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.otpRepo) : super(OtpInitial());
  OtpRepo otpRepo;
  static OtpCubit get(context) => BlocProvider.of(context);

  TextEditingController? controller=TextEditingController();


  Future<void> sendOtpEmailVerification(BuildContext context) async {
    emit(SendVerificationLoading());
    var result = await otpRepo.SendVerificationCode(context);
    result.fold(
      (error) {
        print("Error ${error.message}");
        emit(SendVerificationFailure(error.message));
      },
      (data) {
        if (data.status??false)
          emit(SendVerificationSuccess(data.data));
        else
          emit(SendVerificationFailure(data.errors?.first??"error".toString()));
      },
    );
  }

  Future<void> verifyAccount(BuildContext context, int otp) async {
    emit(VerifyAccountLoading());
    var result = await otpRepo.verifyAccount(context, otp);
    result.fold(
      (error) {
        print("Error ${error.message}");
        emit(VerifyAccountFailure(error.message));
      },
      (data) {
        print("HACJ}K${data.status}");
        if (data.status??false)
          emit(VerifyAccountSuccess(data));
        else
          emit(VerifyAccountFailure(data.errors?.first.toString()));
      },
    );
  }


  Future<void> forgetPassword(BuildContext context, String phone) async {
    emit(ForgetPassLoading());
    print("SSSS${controller?.text.toString()}");
    emit(ForgetPassLoading());
    var result = await otpRepo.forgetPassword(context, phone);
    result.fold(
          (error) {
        print("Error ${error.message}");
        emit(ForgetPassFailure(error.message));
      },
          (data) {
        print("HACJ}K${data.status}");
        if (data.status??false)
          emit(ForgetPassSuccess(data));
        else
          emit(ForgetPassFailure(data.errors?.first.toString()));
      },
    );
  }




  Future<void> forgotPasswordCheckCode(BuildContext context, {required int code, required String phone}) async {
    emit(SendVerificationLoading());
    var result = await otpRepo.forgotPasswordCheckCode(context,otp: code,phone:  phone);
    result.fold(
          (error) {
        print("Error ${error.message}");
        emit(SendVerificationFailure(error.message));
      },
          (data) {
            if(data.status??false)
              emit(SendVerificationSuccess(data.data));
            else
              emit(SendVerificationFailure(data.errors?.first??"Error".toString()));
      },
    );
  }

}
