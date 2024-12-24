import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/payment_select_body.dart';

class PaymentSelectMethodScreen extends StatelessWidget {
  const PaymentSelectMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentSelectMethodBody(),
    );
  }
}
