import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SnappingSheetTitleRequest extends StatelessWidget {
  const SnappingSheetTitleRequest({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Padding(
        //   padding: EdgeInsets.only(
        //       left: width * 0.3, right: width * 0.3, bottom: 25),
        //   child: const Divider(
        //     height: 25,
        //     thickness: 2,
        //     color: AppColors.kgrey,
        //   ),
        // ),

        Text(
          AppLocalizations.of(context)!.trip_details,
          style: TextStyle(
              color: Color.fromARGB(255, 29, 26, 216),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
