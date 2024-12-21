import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_after_ride_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_after_ride_repo_ipm.dart';
import '../../../../Network/local/sharedprefrences.dart';
import 'apiservices.dart';
import 'internetconnection.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));

  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  getIt.registerLazySingleton<PaidAfterRideRepo>(
      () => PaidAfterRideRepoIpm(apiService: getIt()));
}
