import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/routes/route_generator.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
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
    return  LayoutBuilder(
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
    child: BlocBuilder<LocalCubit, LocalState>(
    builder: (context, state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizationCubit()
            ..appLanguage(LanguageEventEnums.initialLanguage),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, langState) {
          Locale? locale;
          if (langState is ChangeLanguage) {
            locale = Locale(langState.languageCode!);
          }
          return MaterialApp(

            localizationsDelegates: AppLocalizations.localizationsDelegates,
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
  }
    ),
    ),
    ),
    );
  }
}
