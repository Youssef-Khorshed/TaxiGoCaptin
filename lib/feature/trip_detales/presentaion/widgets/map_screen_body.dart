import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/Utils/assets/assets.dart';
import 'custom_snapping_sheet.dart';

class LocationScreenBody extends StatelessWidget {
  const LocationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomSnappingSheet(
          isAccepted: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(Assets.imagesBackArrow),
          ),
        ),
      ],
    );
  }
}
