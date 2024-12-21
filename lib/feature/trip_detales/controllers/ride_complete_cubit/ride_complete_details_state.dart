part of 'ride_complete_details_cubit.dart';

@immutable
sealed class RideCompleteDetailsState {}

final class RideCompleteDetailsInitial extends RideCompleteDetailsState {}

final class RideCompleteDetailsLoading extends RideCompleteDetailsState {}

final class RideCompleteDetailsSuccess extends RideCompleteDetailsState {
  final RideCompleteDetailsModel rideCompleteDetailsModel;
  RideCompleteDetailsSuccess(this.rideCompleteDetailsModel);
}

final class RideCompleteDetailsFailure extends RideCompleteDetailsState {
  final String message;
  RideCompleteDetailsFailure(this.message);
}
