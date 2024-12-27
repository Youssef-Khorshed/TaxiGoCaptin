import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';

import 'input_walit_data.dart';

class CardScreenBody extends StatelessWidget {
  const CardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(15), children: [
      const SizedBox(height: 40),
      Container(
        child: Image.asset(AppImages.imagesCardImage),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: InputWaliData(),
      ),
    ]);
  }
}
