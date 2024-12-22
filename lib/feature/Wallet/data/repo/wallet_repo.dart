import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/Utils/Network/Error/failure.dart';
import '../model/get_all_transactions_model.dart';
import '../model/get_profile_model.dart';
import '../model/wallet_model.dart';

abstract class WalletRepo {
  Future<Either<Failure, WalletModel>> getWallet({
    required String amount,
    required BuildContext context,
  });

  Future<Either<Failure, GetAllTransactionsModel>> getAllTransactions({
     String paymentMethod,
     String transactionType,
     required BuildContext context,
  });

    Future<Either<Failure, GetProfileModel>> getProfile({
     required BuildContext context,
  });
}
