import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

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

  getIt.registerSingleton<Chatrepo>(Chatrepoimp(getIt.get<ApiService>(), ));

  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt.get<Chatrepo>()));

  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
//BlocProvider( create: (context) => BooksBySearchCubit(getIt.get<HomeRepoImpl>())