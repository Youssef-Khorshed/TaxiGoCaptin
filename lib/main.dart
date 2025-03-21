import 'package:connectivity_monitor/connectivity_monitor.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Firebase/firebase_options.dart';
import 'package:taxi_go_driver/core/Utils/localization/cubit/local_cubit.dart';
import 'package:taxi_go_driver/feature/APP/captinApp.dart';

import 'Network/local/sharedprefrences.dart';
import 'blocobserever.dart';
import 'core/Utils/Network/Services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  Bloc.observer = MyBlocObserver();
  ConnectivityService.startConnectionNotifier();
  await ScreenUtil.ensureScreenSize();
  await getIt<CacheHelper>().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(DevicePreview(
      enabled: false,
      builder: (context) => BlocProvider(
            create: (context) => LocalCubit(),
            child: Captinapp(),
          )));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
