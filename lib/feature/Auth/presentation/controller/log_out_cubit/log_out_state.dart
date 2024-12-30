part of 'log_out_cubit.dart';

@immutable
sealed class LogOutState {}

final class LogOutInitial extends LogOutState {}

final class LogOutLoading extends LogOutState {}

class LogOutSuccess extends LogOutState {
  final LogOutModel data;
  LogOutSuccess({required this.data});
}

class LogOutError extends LogOutState {
  final String message;
  LogOutError({required this.message});
}
