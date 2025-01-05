part of 'wallet_get_profile_cubit.dart';

@immutable
sealed class WalletGetProfileState {}

final class WalletGetProfileInitial extends WalletGetProfileState {}

final class WalletGetProfileLoading extends WalletGetProfileInitial {}

final class WalletGetProfileSuccess extends WalletGetProfileInitial {
  final GetProfileModel getProfileModel;

  WalletGetProfileSuccess({required this.getProfileModel});
}

final class WalletGetProfileError extends WalletGetProfileInitial {
  final String message;

  WalletGetProfileError({required this.message});
}
