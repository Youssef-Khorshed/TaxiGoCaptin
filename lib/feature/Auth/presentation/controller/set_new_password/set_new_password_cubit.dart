import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/auth_repo.dart';


part 'set_new_password_state.dart';

class SetNewPasswordCubit extends Cubit<SetNewPasswordState> {
  SetNewPasswordCubit(this.authRepo) : super(SetNewPasswordInitial());

  AuthRepo authRepo;

  static SetNewPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController setPasswordController = TextEditingController();
  TextEditingController setOldPasswordController = TextEditingController();

  TextEditingController setPasswordConfirmationController =
  TextEditingController();
  AutovalidateMode setNewPasswordAutoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> setNewPasswordFormKey = GlobalKey<FormState>();
  Future<void> setNewPassword(
      {required String password,
        required String passwordConfirmation,
        required String phone,
        required BuildContext context}) async {
    emit(SetNewPasswordLoading());
    var result = await authRepo.setNewPassword(
        passwordConfirmation: passwordConfirmation,
        password: password,
        phone: phone,
        context: context);
    result.fold((error) {
      emit(SetNewPasswordError(message: error.message));
    }, (data) {
      if (data.status == true) {
        emit(SetNewPasswordSuccess());
      } else {
        emit(SetNewPasswordError(message: data.message ?? "error"));
      }
    });
  }

  Future<void> setPasswordValidate(BuildContext context,String phone) async {
    emit(SetNewPasswordValidateLoading());
    print("object");
    if (setNewPasswordFormKey.currentState!.validate()) {
      setNewPasswordFormKey.currentState!.save();

      setNewPassword(
        phone:phone,
          password: setPasswordController.text,
          passwordConfirmation: setPasswordConfirmationController.text,
          context: context);

      print("valid");
    } else {
      emit(SetNewPasswordValidateError());

      print("ww");
      setNewPasswordAutoValidateMode = AutovalidateMode.always;

    }

  }
}
