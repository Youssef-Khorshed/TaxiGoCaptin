import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class TimerToAccept extends StatelessWidget {
  const TimerToAccept({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        '${AppLocalizations.of(context)!.you_have} 00:15 ${AppLocalizations.of(context)!.to_accept}',
        style: AppStyles.text18Size500Blue);
  }
}
