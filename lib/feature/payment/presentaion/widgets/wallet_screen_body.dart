//import 'package:flutter/material.dart';
//import 'package:taxi_go_driver/feature/payment/presentaion/widgets/rounded_botton.dart';
//import 'package:taxi_go_driver/feature/payment/presentaion/widgets/wallet_item.dart';
//
//import '../../../../core/Utils/colors/colors.dart';
//import '../payment_screen.dart';
//import 'wallet_card.dart';
//
//class WalletScreenBody extends StatelessWidget {
//  const WalletScreenBody({super.key});
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 20),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: [
//          const SizedBox(
//            height: 20,
//          ),
//          const WalletCard(),
//          const SizedBox(
//            height: 20,
//          ),
//          WalletItem(
//            onPressed: () {},
//          ),
//          const Spacer(),
//          RoundedButton(
//            width: double.infinity,
//            backgroundColor: AppColors.kPrimaryColor,
//            textColor: AppColors.kWhite,
//            text: 'Add Money',
//            onPressed: () {
//              //navigate to add money
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => const PaymentSelectMethodScreen()),
//              );
//            },
//          )
//        ],
//      ),
//    );
//  }
//}
