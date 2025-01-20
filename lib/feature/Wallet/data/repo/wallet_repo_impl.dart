import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import '../model/get_all_transactions_model.dart';
import '../model/get_profile_model.dart';
import '../model/wallet_model.dart';
import 'wallet_repo.dart';

class WalletRepoImpl extends WalletRepo {
  ApiService apiService;
  WalletRepoImpl({required this.apiService});

  Future<Either<Failure, WalletModel>> getWallet(
      {required String amount, required dynamic context}) async {
    final response = await apiService.postRequest(
      context: context,
      Constants.depositURL(amount: amount),
    );
    return response.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(WalletModel.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, GetAllTransactionsModel>> getAllTransactions({
    String? paymentMethod,
    String? transactionType,
    required BuildContext context,
  }) async {
    final url = Constants.transactionsURL(
      paymentMethod: paymentMethod,
      transactionType: transactionType,
    );

    final response = await apiService.getRequest(url, context: context);
    return response.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(GetAllTransactionsModel.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, GetProfileModel>> getProfile(
      {required BuildContext context}) async {
    final url = Constants.getProfileURL();
    print('Constructed URL: $url');

    final response = await apiService.getRequest(url, context: context);
    return response.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(GetProfileModel.fromJson(res.data)));
  }
}
