import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'custom_text_field.dart';

class DocumentsFormRow extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  const DocumentsFormRow(
      {super.key, required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyles.text16Size400darkGrey,
        ),
        SizedBox(
          width: mediaQuery.width * 0.5,
          child: CustomTextField(
            label: '',
            validator: (text) {
              if (text == null || text.isEmpty) {
                return AppLocalizations.of(context)!.complete_other_field;
              }
              return null;
            },
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
