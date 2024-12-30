import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/wallet_model.dart';
import '../../data/repo/wallet_repo.dart';

part 'deposit_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepo walletRepo;
  WalletModel? walletModel;

  WalletCubit(this.walletRepo) : super(WalletInitial());

  final TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getWallet(
      {required String amount, required BuildContext context}) async {
    emit(WalletLoading());
    print("Fetching wallet data for amount: $amount");

    final response =
        await walletRepo.getWallet(amount: amount, context: context);

    response.fold(
      (onError) {
        print("Error occurred: $onError");
        emit(WalletError());
      },
      (onSuccess) {
        print("Wallet data fetched successfully.");
        walletModel = onSuccess;
        emit(WalletSuccess(walletModel: walletModel!));
      },
    );
  }

  Future<void> handleAddMoney({
    required BuildContext context,
    required String amount,
  }) async {
    

    await getWallet(amount: amount, context: context);

    if (walletModel != null) {
      final bool success = await tryLaunchUrl(context);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to proceed with payment")),
        );
      }
    }
  }

  Future<bool> tryLaunchUrl(BuildContext context) async {
    final Uri url = Uri.parse(walletModel!.data);
    if (await canLaunchUrl(url)) {
      try {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        return true;
      } catch (e) {
        print("Error launching URL: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error launching URL: $e")),
        );
        return false;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid URL: ${walletModel!.data}")),
      );
      return false;
    }
  }

  // Centralized validation function
  static String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty || value.length < 1001) {
      return "Please enter a valid amount.";
    }

    final number = double.tryParse(value.trim());
    if (number == null || number <= 0) {
      return "Amount must be a positive number.";
    }

    return null;
  }
}
