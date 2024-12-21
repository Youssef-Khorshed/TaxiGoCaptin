import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../../../../widgets/costume_bottun.dart';

class DriverAction extends StatelessWidget {
  const DriverAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: CostumeButton(
              onPressed: () {},
              text: "Decline",
              color: Colors.red.withOpacity(.05),
              textColor: Colors.red,
              borderColor: Colors.red,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CostumeButton(
              text: "Accept",
              textColor: AppColors.kWhite,
              color: AppColors.kblue,
              onPressed: () {
                Navigator.pushNamed(context, Routes.mabScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
