import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_go_driver/settings/Localization/model/localizationmodel.dart';
import '../../../Network/local/sharedprefrences.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  void appLanguage(LanguageEventEnums eventType) async {
    try {
      switch (eventType) {
        case LanguageEventEnums.initialLanguage:
          // Try to get the language from shared preferences
          String? language = CacheHelper.getData(key: 'language');
          if (language != null) {
            emit(ChangeLanguage(
                languageCode: language)); // Emit the saved language
          } else {
            emit(ChangeLanguage(
                languageCode:
                    'en')); // Default to English if no language is saved
          }
          break;

        case LanguageEventEnums.arabicLanguage:
          await CacheHelper.saveData(key: 'language', value: 'ar');
          emit(ChangeLanguage(languageCode: 'ar'));
          break;

        case LanguageEventEnums.englishLanguage:
          await CacheHelper.saveData(key: 'language', value: 'en');
          emit(ChangeLanguage(languageCode: 'en'));
          break;

        default:
          break;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in appLanguage: $e");
      }
    }
  }
}
