import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/add_money_body.dart';


class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddMoneyBody(),
    );
  }
}
