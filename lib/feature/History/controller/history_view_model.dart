import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/feature/History/controller/history_states.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/data/repo/history_repo.dart';

class HistoryViewModel extends Cubit<HistoryStates> {
  HistoryViewModel({required this.historyRepo}) : super(HistoryLoadingStates());
  HistoryRepo historyRepo;
  String? selectedValue;

  List<HistoryData> historyData = [];
  void changeDropDownItem(String item) {
    selectedValue = item;
    emit(ChangeItemDropDown(item: selectedValue!));
  }

  static HistoryViewModel get(context) => BlocProvider.of(context);
  getHistoryData(BuildContext context, {String? tripHistory}) async {
    emit(HistoryLoadingStates());
    var either = await historyRepo.getData(context, tripHistory: tripHistory);
    either.fold(
      (historyFailure) {
        emit(HistoryFailureStates(errMessage: historyFailure.message));
      },
      (historyResponse) {
        historyData = historyResponse.data!;
        emit(HistorySuccessStates(historyDataModel: historyResponse));
      },
    );
  }

  saveTrip(BuildContext context, int rideId) async {
    emit(AddToSaveToFavTripLoadingStates());
    var either = await historyRepo.saveTrip(context, rideId);
    either.fold(
      (savedFailure) {
        emit(AddToSaveToFavFailureStates(errMessage: savedFailure.message));
      },
      (savedResponse) {
        emit(AddToSaveToFavSuccessStates(favAndsaveTripModel: savedResponse));
      },
    );
  }

  addToFavTrip(BuildContext context, int rideId) async {
    emit(AddToSaveToFavTripLoadingStates());
    var either = await historyRepo.addToFavTrip(context, rideId);
    either.fold(
      (favFailure) {
        emit(AddToSaveToFavFailureStates(errMessage: favFailure.message));
      },
      (faveResponse) {
        emit(AddToSaveToFavSuccessStates(favAndsaveTripModel: faveResponse));
      },
    );
  }
}
