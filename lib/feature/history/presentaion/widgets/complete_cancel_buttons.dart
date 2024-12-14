import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../APP/custom_widgets/custom_text.dart';

class CompleteCancelButtons extends StatelessWidget {
  const CompleteCancelButtons({
    super.key,
    required this.isCompleted,
  });

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: isCompleted == true
              ? const Color(0xffE8FCF1)
              : const Color(0xffFDECEF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                  color: isCompleted == true
                      ? const Color(0xffD9F4E5)
                      : const Color(0xffFDECEF)))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
        child: CustomText(
          text: isCompleted == true ? "Completed" : "Cancel",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          colorText:
              isCompleted == true ? AppColors.kComplete : AppColors.kredMap,
        ),
      ),
    );
  }
}
