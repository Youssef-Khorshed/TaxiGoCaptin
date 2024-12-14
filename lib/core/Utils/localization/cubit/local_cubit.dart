import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/localization.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial(const Locale('en')));
  static LocalCubit get(context) => BlocProvider.of(context);
  LocalizationThemeState localizationThemeState = LocalizationThemeState.en;
  Locale localization = const Locale("en");

  void changeLocale() {
    emit(LocaleLoading());

    if (localizationThemeState == LocalizationThemeState.ar) {
      localizationThemeState = LocalizationThemeState.en;
      localization = const Locale("en");
      emit(LocaleSuccess());
    } else {
      localization = const Locale("ar");

      localizationThemeState = LocalizationThemeState.ar;

      emit(LocaleSuccess());
    }
  }

  bool chekLanguage(BuildContext context) => localization == const Locale("en");
}
