import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/settings/Localization/Localizationcubit/localization_cubit.dart';
import 'package:taxi_go_driver/settings/Localization/Model/localizationmodel.dart';
import '../../../core/Utils/colors/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Network/local/sharedprefrences.dart';
import 'blocobserever.dart';
import 'core/Utils/colors/colors.dart';
import 'core/Utils/generated/l10n.dart';
import 'core/Utils/routes/route_generator.dart';
import 'core/Utils/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init(); // Initialize SharedPreferences
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  // Set preferred orientations globally

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            ..appLanguage(LanguageEventEnums.initialLanguage) ,
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, langState) {
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
            ),
          );
        },
      ),
    );
  }
}