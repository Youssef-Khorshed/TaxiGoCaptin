import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/rounded_botton.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/wallet_card.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/wallet_item.dart';
import '../../../../core/Utils/colors/colors.dart';
import 'custom_appbar.dart';

class AddMoneyBody extends StatelessWidget {
  const AddMoneyBody({super.key});

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
              _showAddMoneyModal(context);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _showAddMoneyModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Add Money',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Input Field
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: const TextStyle(fontSize: 14),
                  suffixText: '\$',
                  suffixStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                ),
              ),
              const Spacer(),

              // Buttons
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Add Money Button
                  Expanded(
                      child: RoundedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          width: double.infinity,
                          backgroundColor: AppColors.kPrimaryColor,
                          textColor: AppColors.kWhite,
                          text: 'Add Money')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
