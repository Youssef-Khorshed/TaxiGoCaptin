import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_driver/feature/sign_in/data/repo/sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);
  SignInRepo signInRepo;
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  TextEditingController setPasswordController = TextEditingController();
  TextEditingController setPasswordConfirmationController =
  TextEditingController();
  AutovalidateMode loginAutoValidateMode = AutovalidateMode.disabled;
  AutovalidateMode setPasswordAutoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> setPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> signIn(
      {required String phone,
      required String password,
      required BuildContext context}) async {
    emit(SignInLoading());
  var result=  await signInRepo.signIn(phone: phone, password: password, context: context);
    result.fold((error) {
      emit(SignInError(errorMessage: error.message));
    }, (data) async {
      if (data.status == true) {
        if (data.data?.token != null) {
       await   SecureToken.addToken(data.data!.token!);
        }
        emit(SignInSuccess());

      } else {
        emit(SignInError(errorMessage: data.message ?? "error"));
      }
    });
  }

  Future<void> setPassword(
      {required String password,
      required String passwordConfirmation,
      required BuildContext context}) async {
    emit(SetPasswordLoading());
    var result = await signInRepo.setPassword(
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

    if (setPasswordFormKey.currentState!.validate()) {
      setPasswordFormKey.currentState!.save();


      setPassword(
          password: setPasswordController.text,
          passwordConfirmation: setPasswordConfirmationController.text,
          context: context);

      print("valid");
    } else {
      setPasswordAutoValidateMode = AutovalidateMode.always;
    }
  }

  Future<void> loginValidate(BuildContext context) async {

    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();


      signIn(
          password: loginPassController.text,
          phone: loginPhoneController.text,
          context: context);

      print("valid");
    } else {
      loginAutoValidateMode = AutovalidateMode.always;
    }
  }

}
