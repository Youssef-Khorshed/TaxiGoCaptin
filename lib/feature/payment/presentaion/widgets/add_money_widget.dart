import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/rounded_botton.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';

class AddMoneyWidget extends StatelessWidget {
  const AddMoneyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
              suffixStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.kblue,
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
            ),
          ),
          SizedBox(height: mediaQuery.height / 11),

          // Buttons
          SizedBox(
            height: 100,
            child: Row(
              children: [
                // Cancel Button
                const Expanded(
                    child: CostumeButton(
                        color: Colors.transparent,
                        borderColor: AppColors.kredMap,
                        textColor: AppColors.kredMap,
                        text: 'Add Money')),

                const SizedBox(width: 16),

                // Add Money Button
                Expanded(
                    child: RoundedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: double.infinity,
                        backgroundColor: AppColors.kblue,
                        textColor: AppColors.kWhite,
                        text: 'Add Money')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
