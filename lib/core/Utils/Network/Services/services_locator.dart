import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/dependencyInjection.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo_impl.dart';
import 'package:taxi_go_driver/feature/notification/controller/cubit/get_all_notification_cubit.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo_impl.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_after_ride_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_after_ride_repo_ipm.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete_imp.dart';

import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/internetconnection.dart';

import '../../../../Network/local/sharedprefrences.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  getIt.registerLazySingleton<ApiService>(() =>
      getIt.registerSingleton<ApiService>(
          ApiService(internetConnectivity: getIt.get<InternetConnectivity>())));

  getIt.registerLazySingleton<PaidAfterRideRepo>(
      () => PaidAfterRideRepoIpm(apiService: getIt()));
  getIt.registerLazySingleton<RideCompleteRepo>(
      () => RideCompleteRepoImpl(apiService: sl()));
  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));

  /// For API Services
  getIt.registerLazySingleton<WalletRepo>(
      () => WalletRepoImpl(apiService: getIt()));

  getIt.registerLazySingleton<NotificationRepo>(
      () => NotificationRepoImpl(apiService: getIt()));

  /// For Controller
  getIt.registerFactory(() => WalletCubit(getIt()));
  getIt.registerFactory(() => TransactionCubit(getIt()));
  getIt.registerFactory(() => WalletGetProfileCubit(getIt()));
  getIt.registerFactory(() => GetAllNotificationCubit(getIt()));
}

//getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
//BlocProvider( create: (context) => BooksBySearchCubit(getIt.get<HomeRepoImpl>())
