part of 'cash_amount_cubit.dart';

@immutable
sealed class CashAmountState {}

final class CashAmountInitial extends CashAmountState {}

class RideDetailsInitial extends CashAmountState {}

class RideDetailsLoading extends CashAmountState {}

class RideDetailsSuccess extends CashAmountState {
  final CashAmountModel cashAmountModel;

  RideDetailsSuccess(this.cashAmountModel);
}

class RideDetailsError extends CashAmountState {
  final String message;

  RideDetailsError(this.message);
}
