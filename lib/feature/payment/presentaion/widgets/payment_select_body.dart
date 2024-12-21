import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/rounded_botton.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/wallet_card.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/wallet_item.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../add_money_screen.dart';
import 'custom_appbar.dart';

class PaymentSelectMethodBody extends StatelessWidget {
  const PaymentSelectMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppbar(
            onPressed: () {},
            icon: Image.asset('assets/images/Path4671.png'),
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
              _selectPaymentMethod(context);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _selectPaymentMethod(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              RadioListTile(
                  value: 'Option1',
                  groupValue: 'selected',
                  onChanged: (value) {},
                  title: Image.asset('assets/images/Payment.png')
                  //const Text('Zally'),
                  // secondary: const Icon(Icons.payment),
                  ),
              const Spacer(),
              RoundedButton(
                width: double.infinity,
                backgroundColor: AppColors.kPrimaryColor,
                textColor: AppColors.kWhite,
                text: 'Next',
                onPressed: () {
                  //navigate to add money
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddMoneyScreen()),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
