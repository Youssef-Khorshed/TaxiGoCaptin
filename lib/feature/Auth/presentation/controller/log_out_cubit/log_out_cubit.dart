import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../Core/Utils/Network/Services/secure_token.dart';

import '../../../data/models/log_out/Log_out_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  AuthRepo authRepo;
  LogOutCubit(this.authRepo) : super(LogOutInitial());
static LogOutCubit get(context) => BlocProvider.of(context);


  Future<void> logOut(BuildContext context) async {
    emit(LogOutLoading());
    var result = await authRepo.logout(context);
    result.fold(
          (error) {
        print("Error ${error.message}");
        emit(LogOutError( message: error.message));
      },
          (data) async {
        if (data.status??false) {

          emit(LogOutSuccess( data: data));

        } else {
          emit((data.errors?.first??"error".toString()));
        }
      },
    );
  }
}

