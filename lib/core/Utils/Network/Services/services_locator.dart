import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo_impl.dart';

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
  getIt.registerSingleton<NearbyRideRequestsRepoImpl>(
      NearbyRideRequestsRepoImpl(getIt.get<ApiService>()));

  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
//BlocProvider( create: (context) => BooksBySearchCubit(getIt.get<HomeRepoImpl>())
