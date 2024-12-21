import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';
import '../../../profile/presentaion/widgets/costum_text_faild.dart';

class InputWaliData extends StatelessWidget {
  const InputWaliData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CostumeTextField(text: "mohamed", icon: Icons.wallet),
      const CostumeTextField(
          text: "5100 4560 40000 7587", icon: Icons.wallet_rounded),
      const CostumeTextField(
        text: "05/25",
        icon: Icons.calendar_month,
      ),
      const CostumeTextField(text: "222", icon: Icons.security),
      const SizedBox(
        height: 150,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: const CostumeButton(
          color: AppColors.kblue,
          text: "Savs Card ",
          textColor: AppColors.kWhite,
        ),
      ),
    ]);
  }
}
