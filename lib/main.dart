import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/APP/captinApp.dart';
import 'Network/local/sharedprefrences.dart';
import 'blocobserever.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init(); // Initialize SharedPreferences
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  // Set preferred orientations globally

  runApp(const Captinapp());
}
