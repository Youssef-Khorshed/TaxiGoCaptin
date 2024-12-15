import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/controller/sign_in_cubit.dart';

import '../../../../Network/local/sharedprefrences.dart';
import '../../../../feature/sign_in/data/repo/sign_In_repo_impl.dart';
import '../../../../feature/sign_in/data/repo/sign_in_repo.dart';
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

  getIt.registerSingleton<SignInRepo>(
      SingInRepoImpl( getIt.get<ApiService>()));
  getIt.registerSingleton<SignInCubit>(
      SignInCubit(getIt.get<SignInRepo>()));
  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
//BlocProvider( create: (context) => BooksBySearchCubit(getIt.get<HomeRepoImpl>())