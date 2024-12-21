import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/Utils/assets/images.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 20),
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(AssetImagesconst.backArrow)),
    );
  }
}
