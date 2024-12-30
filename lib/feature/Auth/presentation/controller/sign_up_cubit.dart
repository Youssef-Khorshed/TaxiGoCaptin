import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_driver/feature/Auth/data/repo/auth_repo.dart';
import '../../../../../Core/Utils/enums/gender.dart';
import '../../data/models/sign_up_model/Data.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  AuthRepo authRepo;

  SignUpCubit(this.authRepo) : super(SignUpInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Gender selectedGender = Gender.non;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  List<String> genderList(context) => [
        AppLocalizations.of(context)!.male,
        AppLocalizations.of(context)!.female
      ];

  static SignUpCubit get(context) => BlocProvider.of(context);
  signUp(
      {required String name,
      required String phone,
      required String gender,
      required BuildContext context}) async {
    emit(SignUpLoading());

    if (selectedGender == Gender.non) {
      emit(SignUpFailure(AppLocalizations.of(context)!.please_select_gender));
      return;
    }

    var result = await authRepo.signUp(
        name: name, phone: phone, gender: gender, context: context);
    result.fold((l) => emit(SignUpFailure(l.message)), (r) async {
      await SecureToken.addToken(r.token!);
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
