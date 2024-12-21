part of 'pay_after_ride_cubit.dart';

@immutable
sealed class PayAfterRideState {}

final class PayAfterRideInitial extends PayAfterRideState {}

final class PayAfterRideLoading extends PayAfterRideState {}

final class PayAfterRideSuccess extends PayAfterRideState {
  final bool status;
  PayAfterRideSuccess({required this.status});
}

final class PayAfterRideFailure extends PayAfterRideState {
  final String msg;
  PayAfterRideFailure({required this.msg});
}
