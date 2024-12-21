import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';

class AddCardWidget extends StatelessWidget {
  const AddCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: MediaQuery.of(context).size.width * 0.05,
      top: MediaQuery.of(context).size.height * 0.45,
      bottom: 0,
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 2.0,
            ),
          ],
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const Icon(
          Icons.add,
          color: AppColors.kblue,
          size: 30,
        ),
      ),
    );
  }
}
