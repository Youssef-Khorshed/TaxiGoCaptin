import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';

class SnappingSheetTitleRequest extends StatelessWidget {
  const SnappingSheetTitleRequest({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width * 0.3, right: width * 0.3, bottom: 25),
          child: const Divider(
            height: 25,
            thickness: 7,
            color: AppColors.kgrey,
          ),
        ),
        const Text(
          'Trip Details',
          style: TextStyle(
              color: Color.fromARGB(255, 29, 26, 216),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
