import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/feature/APP/captinApp.dart';
import 'Network/local/sharedprefrences.dart';
import 'blocobserever.dart';
import 'core/Utils/Network/Services/secure_token.dart';
import 'core/Utils/Network/Services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  // Set preferred orientations globally
  //edit
  await setup();
  SecureToken.addToken(Constants.captinToken);
  await getIt<CacheHelper>().init();

  runApp(DevicePreview(enabled: true, builder: (context) => const Captinapp()));
}
