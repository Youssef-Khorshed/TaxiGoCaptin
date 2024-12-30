import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/auth_repo.dart';
part 'set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  AuthRepo authRepo;

  static SetPasswordCubit get(context) => BlocProvider.of(context);

  SetPasswordCubit(this.authRepo) : super(SetPasswordInitial());
  TextEditingController setPasswordController = TextEditingController();
  TextEditingController setPasswordConfirmationController =
      TextEditingController();
  AutovalidateMode setPasswordAutoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> setPasswordFormKey = GlobalKey<FormState>();
  Future<void> setPassword(
      {required String password,
      required String passwordConfirmation,
      required BuildContext context}) async {
    emit(SetPasswordLoading());
    var result = await authRepo.setPassword(
        passwordConfirmation: passwordConfirmation,
        password: password,
        context: context);
    result.fold((error) {
      emit(SetPasswordError(errorMessage: error.message));
    }, (data) {
      if (data.status == true) {
        emit(SetPasswordSuccess());
      } else {
        emit(SetPasswordError(errorMessage: data.message ?? "error"));
      }
    });
  }

  Future<void> setPasswordValidate(BuildContext context) async {
    emit(SetPasswordInitial());
    print("object");
    if (setPasswordFormKey.currentState!.validate()) {
      setPasswordFormKey.currentState!.save();

      setPassword(
          password: setPasswordController.text,
          passwordConfirmation: setPasswordConfirmationController.text,
          context: context);

      print("valid");
    } else {
      print("ww");
      setPasswordAutoValidateMode = AutovalidateMode.always;
    }
  }
}
