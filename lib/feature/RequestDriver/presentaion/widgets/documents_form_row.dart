import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            label,
            style: AppStyles.style16BlackW600.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
        verticalSpace(10.h),
        CustomTextField(
          label: '',
          validator: (text) {
            if (text == null || text.isEmpty) {
              return AppLocalizations.of(context)!.complete_other_field;
            }
            return null;
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}
