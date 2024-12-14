import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/select_payment_widget.dart';

import 'add_money_widget.dart';

abstract class AppDialogs {
  static void showAddMoneyModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return const AddMoneyWidget();
      },
    );
  }

  static void selectPaymentMethod(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        String selectedMethod = 'zain';

        return SelectPaymentWidget(
          initialSelectedMethod: selectedMethod,
        );
      },
    );
  }
}
