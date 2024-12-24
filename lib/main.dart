import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/dependencyInjection.dart';
import 'package:taxi_go_driver/feature/APP/captinApp.dart';
import 'Network/local/sharedprefrences.dart';
import 'app_constants.dart';
import 'blocobserever.dart';
import 'core/Utils/Network/Services/secure_token.dart';
import 'core/Utils/Network/Services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceLocator = ServicesLocator();
  serviceLocator.init();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  // Set preferred orientations globally
  await setup();
  SecureToken.addToken(AppConstants.kTokenValue);
  await getIt<CacheHelper>().init();

  runApp(const Captinapp());
}
