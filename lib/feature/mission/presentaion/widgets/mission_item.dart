import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../APP/custom_widgets/custom_text.dart';
import 'custom_check.dart';

class MissionItem extends StatelessWidget {
  const MissionItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 23.0),
        child: Container(
          decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                    blurRadius: 4,
                    color: const Color(0xffC2C1FB).withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurStyle: BlurStyle.inner)
              ],
              color: AppColors.kWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            child: Row(
              children: [
                CustomText(
                  text: title,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  style: const TextStyle(color: AppColors.kBlack),
                ),
                const Spacer(),
                const CustomCheck(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
