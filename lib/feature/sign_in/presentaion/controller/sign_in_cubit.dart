import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxi_go_driver/feature/sign_in/data/repo/sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignInInitial());
 static SignInCubit get(context) => BlocProvider.of(context);
  SignInRepo signInRepo;

  Future<void> signIn({required String phone, required String password, required BuildContext context}) async {
    emit(SignInLoading());
    print("wwww");
  await  signInRepo.signIn(phone: phone, password: password, context: context);
  }
}
