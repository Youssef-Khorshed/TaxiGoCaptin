import 'package:flutter/material.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../../../../widgets/costume_bottun.dart';
import 'account_details.dart';
import 'bank_account_card.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: 140,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(14)),
            padding: const EdgeInsets.all(10),
            child: const ProfileDetails(),
          ),
        ),
        const BankAccountCard(),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const CostumeButton(
              text: "Delete Account",
              textColor: Colors.red,
              borderColor: Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
            CostumeButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signInRoute);
              },
              text: "Logout",
              color: AppColors.kblue,
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
