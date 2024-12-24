import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/cash_amount_model/cash_amount_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/cash_amount_repo/cash_amount_repo.dart';

part 'cash_amount_state.dart';

class CashAmountCubit extends Cubit<CashAmountState> {
  CashAmountCubit(this.cashAmountRepository) : super(CashAmountInitial());
  final CashAmountRepo cashAmountRepository;
  String cashAmount = "0.0";
  final formKey = GlobalKey<FormState>();
  final fareController = TextEditingController();
  Future<void> loadRideDetails(context) async {
    emit(RideDetailsLoading());
    try {
      final details = await cashAmountRepository.getAmount(context);
      details.fold(
        (failure) => emit(RideDetailsError(failure.message)),
        (rideDetails) {
          cashAmount = rideDetails.cashAmount;
          emit(RideDetailsSuccess(rideDetails));
        },
      );
    } catch (error) {
      emit(RideDetailsError("Failed to fetch ride details"));
    }
  }

  bool isCashAmountPositive(CashAmountModel amount) {
    return amount.isCashAmountPositive();
  }
}
