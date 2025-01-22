import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_driver/Network/local/sharedprefrences.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/internetconnection.dart';
import 'package:taxi_go_driver/core/Utils/localization/cubit/local_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/data/repo/auth_repo.dart';
import 'package:taxi_go_driver/feature/Auth/data/repo/auth_repo_impl.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/create_profile_cubit/create_profile_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/log_out_cubit/log_out_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/otp_cubit/otp_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/set_new_password/set_new_password_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/set_password_cubit/set_password_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/sign_up_cubit.dart';
import 'package:taxi_go_driver/feature/History/controller/history_view_model.dart';
import 'package:taxi_go_driver/feature/History/data/repo/history_repo.dart';
import 'package:taxi_go_driver/feature/History/data/repo/history_repo_impl.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_driver/feature/Map/Data/Repo/mapRepoimp.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/repos/captain_documents_repo_impl.dart';
import 'package:taxi_go_driver/feature/chat/data/repo/chatrepo.dart';
import 'package:taxi_go_driver/feature/chat/data/repo/chatrepoimp.dart';
import 'package:taxi_go_driver/feature/chat/model_view/manger/chat/chat_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo_impl.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo.dart';
import 'package:taxi_go_driver/feature/Wallet/data/repo/wallet_repo_impl.dart';
import 'package:taxi_go_driver/feature/notification/controller/cubit/get_all_notification_cubit.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo.dart';
import 'package:taxi_go_driver/feature/notification/data/repo/notification_repo_impl.dart';
import 'package:taxi_go_driver/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/cash_amount_repo/cash_amount_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/cash_amount_repo/cash_amount_repo_ipm.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_repo/paid_after_ride_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_repo/paid_after_ride_repo_ipm.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete_imp.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  // Repositories
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt.get<ApiService>()));
  // Cubits
  getIt.registerFactory<CreateProfileCubit>(
      () => CreateProfileCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SetPasswordCubit>(
      () => SetPasswordCubit(getIt.get<AuthRepo>()));
  getIt.registerLazySingleton<HistoryRepo>(
      () => HistoryRepoImpl(apiService: getIt.get()));
  getIt.registerFactory<HistoryViewModel>(
      () => HistoryViewModel(historyRepo: getIt.get<HistoryRepo>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SetNewPasswordCubit>(
      () => SetNewPasswordCubit(getIt.get<AuthRepo>()));
  getIt.registerSingleton<LogOutCubit>(LogOutCubit(getIt.get<AuthRepo>()));
  getIt.registerSingleton<ProfileRepoImpl>(
      ProfileRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<LocalCubit>(LocalCubit());

  getIt.registerLazySingleton<PaidAfterRideRepo>(
      () => PaidAfterRideRepoIpm(apiService: getIt()));
  getIt.registerSingleton<NearbyRideRequestsRepoImpl>(
      NearbyRideRequestsRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<Chatrepo>(Chatrepoimp(getIt.get<ApiService>()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt.get<Chatrepo>()));

  getIt.registerSingleton<CaptainDocumentsRepoImpl>(
      CaptainDocumentsRepoImpl(getIt.get<ApiService>()));

  getIt.registerLazySingleton<MapRepo>(() => Maprepoimp(apiService: getIt()));

  getIt.registerFactory(() => MapsCubit(mapsRepository: getIt()));

//BlocProvider( create: (context) => BooksBySearchCubit(getIt.get<HomeRepoImpl>())

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
