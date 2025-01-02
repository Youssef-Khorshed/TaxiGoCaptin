import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/localization/cubit/local_cubit.dart';
import 'package:taxi_go_driver/core/Utils/routes/route_generator.dart';
import 'package:taxi_go_driver/feature/Auth/data/repo/auth_repo.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/log_out_cubit/log_out_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/otp_cubit/otp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/History/controller/history_view_model.dart';
import 'package:taxi_go_driver/feature/History/data/repo/history_repo_impl.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/RequestDriver/controller/cubit/captain_documents_cubit.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/repos/captain_documents_repo_impl.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/controller/nearby_ride_requests_model_cubit/nearby_ride_requests_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo_impl.dart';
import 'package:taxi_go_driver/feature/profile/controller/profile_view_model.dart';
import 'package:taxi_go_driver/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:taxi_go_driver/settings/Localization/Localizationcubit/localization_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/pay_after_ride_controller/pay_after_ride_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/cash_amount_cubit/cash_amount_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/cash_amount_repo/cash_amount_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_repo/paid_after_ride_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_driver/settings/Localization/localizationmodel.dart';

class Captinapp extends StatefulWidget {
  const Captinapp({super.key});

  @override
  State<Captinapp> createState() => _CaptinappState();
}

class _CaptinappState extends State<Captinapp> {
  getToken() async {
    token = await SecureToken.getToken();
  }

  String? token;

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 500) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    return LayoutBuilder(
      builder: (context, constraints) => ScreenUtilInit(
        designSize: constraints.maxWidth >= 600
            ? const Size(200, 912)
            : constraints.maxWidth < 390
                ? const Size(490, 912)
                : const Size(390, 844),
        ensureScreenSize: true,
        minTextAdapt: true,
        builder: (context, child) => BlocProvider(
          create: (context) => LocalCubit()..isConnection(),
          child: BlocBuilder<LocalCubit, LocalState>(builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => LogOutCubit(getIt.get<AuthRepo>())),
                BlocProvider(
                  create: (context) => NearbyRideRequestsCubit(
                      getIt.get<NearbyRideRequestsRepoImpl>()),
                ),
                BlocProvider(
                  create: (context) => getIt.get<MapsCubit>(),
                ),
                BlocProvider(
                  create: (context) => CaptainDocumentsCubit(
                      getIt.get<CaptainDocumentsRepoImpl>()),
                ),
                BlocProvider(
                  create: (context) => LocalizationCubit()
                    ..appLanguage(LanguageEventEnums.initialLanguage),
                ),
                BlocProvider(create: (context) => getIt.get<OtpCubit>()),
                BlocProvider(
                  create: (context) =>
                      RideCompleteDetailsCubit(getIt<RideCompleteRepo>())
                        ..getRideCompleteDetails(context),
                ),
                BlocProvider(
                    create: (context) => HistoryViewModel(
                        historyRepo: getIt.get<HistoryRepoImpl>())),
                BlocProvider(
                  create: (context) =>
                      PayAfterRideCubit(getIt<PaidAfterRideRepo>()),
                ),
                BlocProvider(
                  create: (context) => CashAmountCubit(getIt<CashAmountRepo>())
                    ..loadRideDetails(context),
                ),
                BlocProvider(
                    create: (context) => ProfileViewModel(
                        profileRepo: getIt.get<ProfileRepoImpl>())),
              ],
              child: BlocBuilder<LocalizationCubit, LocalizationState>(
                builder: (context, langState) {
                  return MaterialApp(
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: LocalCubit.get(context).localization,
                    builder: DevicePreview.appBuilder,
                    title: 'Taxi Go Driver',
                    initialRoute: token != null
                        ? Routes.welcomeRoute // welcom
                        : Routes.splashScreenRoute, //splash
                    onGenerateRoute: RouteGenerator.getRoute,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      scaffoldBackgroundColor: AppColors.kWhite,
                      colorScheme: ColorScheme.fromSeed(
                        seedColor: AppColors.kblue,
                      ),
                      useMaterial3: true,
                    ),
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null &&
                            deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
