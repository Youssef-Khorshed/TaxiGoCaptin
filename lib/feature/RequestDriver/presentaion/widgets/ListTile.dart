import 'icon.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, this.notDoneYet = true});
  final bool notDoneYet;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        notDoneYet
            ? Container()
            : Text(AppLocalizations.of(context)!.complete_other_field,
                style: AppStyles.text14Size500WightRed),
        Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 18),
          child: ListTile(
            onTap: () {},
            onLongPress: () {
              print("Tile long-pressed");
            },
            title: Text(
              title,
              style: AppStyles.text16Size400darkGrey,
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.download_the_document,
              style: AppStyles.text14Size500White,
            ),
            trailing: const CustomIcon(),
          ),
        ),
      ],
    );
  }
}
