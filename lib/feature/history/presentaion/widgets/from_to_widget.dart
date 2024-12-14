import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../APP/custom_widgets/custom_text.dart';


class FromToWidget extends StatelessWidget {
  const FromToWidget({
    super.key,
    required this.dist,
    required this.time,
    required this.image,
  });

  final String dist;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        const SizedBox(
          width: 10,
        ),
        CustomText(
          text: dist,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          colorText: Colors.black,
        ),
        const Spacer(),
        CustomText(
          text: time,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          colorText: AppColors.kgrey,
        )
      ],
    );
  }
}
