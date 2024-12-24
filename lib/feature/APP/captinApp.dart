import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/dependencyInjection.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/routes/route_generator.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/pay_after_ride_controller/pay_after_ride_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_after_ride_repo.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_driver/settings/Localization/Localizationcubit/localization_cubit.dart';
import 'package:taxi_go_driver/settings/Localization/Model/localizationmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/Utils/localization/cubit/local_cubit.dart';

class Captinapp extends StatelessWidget {
  const Captinapp({super.key});

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
                  create: (context) => LocalizationCubit()
                    ..appLanguage(LanguageEventEnums.initialLanguage),
                ),
                BlocProvider(
                  create: (context) =>
                      RideCompleteDetailsCubit(getIt<RideCompleteRepo>())
                        ..getRideCompleteDetails(context),
                ),
                BlocProvider(
                  create: (context) =>
                      PayAfterRideCubit(getIt.get<PaidAfterRideRepo>()),
                ),
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
                    initialRoute: Routes.splashScreenRoute,
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
