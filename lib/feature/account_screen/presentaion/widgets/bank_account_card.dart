import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/routes/routes.dart';
import 'bank_account_details.dart';

class BankAccountCard extends StatelessWidget {
  const BankAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          offset: Offset(0, 3),
        )
      ], borderRadius: BorderRadius.circular(14), color: Colors.white),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(children: [
        Row(
          children: [
            const Text("BANK ACCOUNT & CARDS"),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.cardScreen);
              },
              child: SvgPicture.asset(
                AppIcons.iconsEdit,
                height: 40,
              ),
            ),
          ],
        ),
        const BankAccountDetails(),
        Row(children: [
          Container(
            decoration: BoxDecoration(
                // color: AppColors.kDarkBlue.withOpacity(.05),
                borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          const Text(
            "ADD BANK ACCOUNT",
            style: TextStyle(color: AppColors.kgrey, fontSize: 16),
          ),
        ]),
      ]),
    );
  }
}
