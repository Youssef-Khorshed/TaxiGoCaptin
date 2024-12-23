import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class Validation {

  static String? validatePhone(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.phone_required;  // Use localized message
    }

    String pattern = r'$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return AppLocalizations.of(context)!.phone_invalid;  // Use localized message
    }

    return null;
  }

  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.name_required;  // Use localized message
    }

    String pattern = r'^[a-zA-Z\s]+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return AppLocalizations.of(context)!.name_invalid;  // Use localized message
    }

    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.email_required;  // Use localized message
    }

    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return AppLocalizations.of(context)!.email_invalid;  // Use localized message
    }

    return null;
  }
  static String? validatePassword(String? value,BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.password_required;
    }
    var regex = RegExp(
      r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$",
    );

    if (!regex.hasMatch(value)) {
      return 'Password must be atleast A-Z, a-z, @-#-&.. , 1-9';
    }

    return null;
  }

}
