import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/card_screen/presentaion/widgets/add_card_widget.dart';
import 'package:taxi_go_driver/feature/card_screen/presentaion/widgets/card_screen_body.dart';

import '../../../core/Utils/colors/colors.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text(
          "Edit Card",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: const Stack(children: [
        CardScreenBody(),
        AddCardWidget(),
      ]),
    );
  }
}
