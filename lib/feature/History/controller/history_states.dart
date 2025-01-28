import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/data/save_trip_model.dart';

abstract class HistoryStates {}

class HistoryLoadingStates extends HistoryStates {}

class HistoryFailureStates extends HistoryStates {
  final String errMessage;
  HistoryFailureStates({required this.errMessage});
}

class HistorySuccessStates extends HistoryStates {
  final HistoryDataModel historyDataModel;
  HistorySuccessStates({required this.historyDataModel});
}

class ChangeItemDropDown extends HistoryStates {
  final String item;
  ChangeItemDropDown({required this.item});
}

class AddToSaveToFavTripLoadingStates extends HistoryStates {}

class AddToSaveToFavFailureStates extends HistoryStates {
  final String errMessage;
  AddToSaveToFavFailureStates({required this.errMessage});
}

class AddToSaveToFavSuccessStates extends HistoryStates {
  final AddToSaveToFavTripModel favAndsaveTripModel;
  AddToSaveToFavSuccessStates({required this.favAndsaveTripModel});
}
