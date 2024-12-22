import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
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
    try {
      final response = await apiService.postRequest(
        context: context,
        Constants.depositURL(amount: amount),
      );
      return Right(WalletModel.fromJson(response));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, GetAllTransactionsModel>> getAllTransactions({
    String? paymentMethod,
    String? transactionType,
    required BuildContext context,
  }) async {
    try {
      final url = Constants.transactionsURL(
        paymentMethod: paymentMethod,
        transactionType: transactionType,
      );
      print('Constructed URL: $url');

      final response = await apiService.getRequest(url, context: context);
      print('Raw API response: $response');

      return Right(GetAllTransactionsModel.fromJson(response));
    } on NoInternetException {
      print('Error: No internet connection');
      return Left(InternetConnectionFailure(message: 'No internet connection'));
    } on ServerException catch (e) {
      print('Error: ServerException - ${e.message}');
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      print('Error: Unexpected exception - $e');
      return Left(ServerFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, GetProfileModel>> getProfile(
      {required BuildContext context}) async {
    try {
      final url = Constants.getProfileURL();
      print('Constructed URL: $url');

      final response = await apiService.getRequest(url, context: context);
      print('Raw API response: $response');
      return Right(GetProfileModel.fromJson(response));
    } on NoInternetException {
      print('Error: No internet connection');
      return Left(InternetConnectionFailure(message: 'No internet connection'));
    } on ServerException catch (e) {
      print('Error: ServerException - ${e.message}');
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      print('Error: Unexpected exception - $e');
      return Left(ServerFailure(message: 'Unexpected error: $e'));
    }
  }
}
