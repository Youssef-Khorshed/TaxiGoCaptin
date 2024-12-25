import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/app_dialogs.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/custom_appbar.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/rounded_botton.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/wallet_card.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/wallet_item.dart';

import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/assets/images.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              child: CustomAppbar(
                icon: SvgPicture.asset(
                  AppImages.backArrow,
                  height: 15,
                  width: 15,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const WalletCard(),
            const SizedBox(
              height: 20,
            ),
            WalletItem(
              onPressed: () {
                AppDialogs.selectPaymentMethod(context);
              },
            ),
            const Spacer(),
            RoundedButton(
              width: double.infinity,
              backgroundColor: AppColors.kblue,
              textColor: AppColors.kWhite,
              text: 'Add Money',
              onPressed: () {
                AppDialogs.selectPaymentMethod(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
