import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/Network/netwoekcubit/cubit/networkcubit_cubit.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/generated/l10n.dart';
import 'package:taxi_go_driver/core/Utils/routes/route_generator.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/settings/Localization/Localizationcubit/localization_cubit.dart';
import 'package:taxi_go_driver/settings/Localization/Model/localizationmodel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizationCubit()
            ..appLanguage(LanguageEventEnums.initialLanguage),
        ),
        BlocProvider(create: (context) => NetworkCubit()),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, langState) {
          final networkCubit = context.watch<NetworkCubit>();
          Locale? locale;
          if (langState is ChangeLanguage) {
            locale = Locale(langState.languageCode!);
          }
          return ScreenUtilInit(
              designSize: const Size(393, 852),
              minTextAdapt: true,
              child: MaterialApp(
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
                locale: locale,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
              ));
        },
      ),
    );
  }
}
