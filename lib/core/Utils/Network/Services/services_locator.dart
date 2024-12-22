import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/internetconnection.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo_impl.dart';
import 'package:taxi_go_driver/feature/notification/controller/cubit/get_all_notification_cubit.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo_impl.dart';
import '../../../../Network/local/sharedprefrences.dart';
import '../../../../feature/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  getIt.registerLazySingleton<ApiService>(() =>
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

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

//getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
//BlocProvider( create: (context) => BooksBySearchCubit(getIt.get<HomeRepoImpl>())

}
