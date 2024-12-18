import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

AppBar documentCustomAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      AppLocalizations.of(context)!.my_document,
      style: AppStyles.text20Size500WightDarkGray,
    ),
  );
}
