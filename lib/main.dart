import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/APP/captinApp.dart';
import 'Network/local/sharedprefrences.dart';
import 'blocobserever.dart';
import 'core/Utils/Network/Services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  // Set preferred orientations globally
  await setup();
  await CacheHelper.init(); // Initialize SharedPreferences

  runApp(const Captinapp());
}
