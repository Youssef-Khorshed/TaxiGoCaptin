import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_driver/feature/Map/Data/Repo/mapRepoimp.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_after_ride_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_after_ride_repo_ipm.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/repos/captain_documents_repo_impl.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo_impl.dart';
import '../../../../Network/local/sharedprefrences.dart';
import '../../../../feature/chat/data/repo/chatrepo.dart';
import '../../../../feature/chat/data/repo/chatrepoimp.dart';
import '../../../../feature/chat/model_view/manger/chat/chat_cubit.dart';
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
  getIt.registerSingleton<NearbyRideRequestsRepoImpl>(
      NearbyRideRequestsRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<Chatrepo>(Chatrepoimp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<CaptainDocumentsRepoImpl>(
      CaptainDocumentsRepoImpl(getIt.get<ApiService>()));

  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt.get<Chatrepo>()));

  getIt.registerLazySingleton<MapRepo>(() => Maprepoimp(apiService: getIt()));

  getIt.registerFactory(() => MapsCubit(mapsRepository: getIt()));
}
