// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/model/get_profile_model.dart';
import '../../../data/repo/wallet_repo.dart';
part 'wallet_get_profile_state.dart';

class WalletGetProfileCubit extends Cubit<WalletGetProfileState> {
  final WalletRepo walletRepo;
  GetProfileModel? getProfileModel;
  WalletGetProfileCubit(
    this.walletRepo,
  ) : super(WalletGetProfileInitial());

  Future<void> getProfile({required BuildContext context}) async {
    emit(WalletGetProfileLoading());
    final response = await walletRepo.getProfile(context: context);
    response.fold(
      (onError) {
        emit(WalletGetProfileError(message: onError.message));
      },
      (onSuccess) {
        getProfileModel = onSuccess;
        emit(WalletGetProfileSuccess(getProfileModel: getProfileModel!));
      },
    );
  }
}
