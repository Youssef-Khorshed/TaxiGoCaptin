import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/data/model/Data.dart';

import '../../../../core/Utils/enums/gender.dart';
import '../../../../core/Utils/validation.dart';
import '../../data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Gender selectedGender = Gender.male;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  static SignUpCubit get(context) => BlocProvider.of(context);
  signUp(
      {required String name,
      required String phone,
      required String gender,
      required BuildContext context}) async {

    emit(SignUpLoading());
    var result = await signUpRepo.signUp(
        name: name, phone: phone, gender: gender, context: context);
    emit(SignUpInitial());
    result.fold((l) => emit(SignUpFailure(l.message)),
            (r) async {

      emit(SignUpSuccess(r));
    });
  }

  Future<void> validate(BuildContext context) async {

    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();

      signUp(
          name: nameController.text,
          phone: phoneController.text,
          gender: selectedGender.name.toString(),
          context: context);

      print("valid");
    } else {
      autoValidateMode = AutovalidateMode.always;

    }

  }
}
