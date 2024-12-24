import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo_impl.dart';
import 'package:taxi_go_driver/feature/notification/controller/cubit/get_all_notification_cubit.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo_impl.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/cash_amount_repo/cash_amount_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/cash_amount_repo/cash_amount_repo_ipm.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_repo/paid_after_ride_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_repo/paid_after_ride_repo_ipm.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete_imp.dart';

import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/internetconnection.dart';

import '../../../../Network/local/sharedprefrences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  if (!getIt.isRegistered<CacheHelper>()) {
    getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  }

  if (!getIt.isRegistered<Connectivity>()) {
    getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  }

  if (!getIt.isRegistered<InternetConnectivity>()) {
    getIt.registerLazySingleton<InternetConnectivity>(
        () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  }

  if (!getIt.isRegistered<ApiService>()) {
    getIt.registerLazySingleton<ApiService>(() =>
        ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));
  }

  if (!getIt.isRegistered<PaidAfterRideRepo>()) {
    getIt.registerLazySingleton<PaidAfterRideRepo>(
        () => PaidAfterRideRepoIpm(apiService: getIt.get<ApiService>()));
  }

  if (!getIt.isRegistered<RideCompleteRepo>()) {
    getIt.registerLazySingleton<RideCompleteRepo>(
        () => RideCompleteRepoImpl(apiService: getIt.get<ApiService>()));
  }

  if (!getIt.isRegistered<WalletRepo>()) {
    getIt.registerLazySingleton<WalletRepo>(
        () => WalletRepoImpl(apiService: getIt.get<ApiService>()));
  }

  if (!getIt.isRegistered<NotificationRepo>()) {
    getIt.registerLazySingleton<NotificationRepo>(
        () => NotificationRepoImpl(apiService: getIt.get<ApiService>()));
  }
  if (!getIt.isRegistered<CashAmountRepo>()) {
    getIt.registerLazySingleton<CashAmountRepo>(
        () => CashAmountRepoIpm(apiService: getIt.get<ApiService>()));
  }

  // تسجيل الـ Cubits
  getIt.registerFactory(() => WalletCubit(getIt.get<WalletRepo>()));
  getIt.registerFactory(() => TransactionCubit(getIt.get<WalletRepo>()));
  getIt.registerFactory(() => WalletGetProfileCubit(getIt.get<WalletRepo>()));
  getIt.registerFactory(
      () => GetAllNotificationCubit(getIt.get<NotificationRepo>()));
}
