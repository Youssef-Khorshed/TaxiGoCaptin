
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/widgets/custom_text_field.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';

class InputWaliData extends StatelessWidget {
  const InputWaliData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextField(
      label:"mohamed",
      suffixIcon:  Icon(Icons.wallet), onChanged: (String ) {  },),

      CustomTextField(
          label:"5100 4560 40000 7587",
          suffixIcon:  Icon(Icons.wallet_rounded), onChanged: (String ) {  },),
      CustomTextField(
        label:"05/25" ,
        suffixIcon: const Icon(Icons.calendar_month), onChanged: (String ) {  },
        // text: "05/25",
        // icon: Icons.calendar_month,
      ),
      CustomTextField(

        label:"222" ,
        suffixIcon: const Icon(Icons.security), onChanged: (String ) {  },
      ),
      const SizedBox(
        height: 150,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: const CostumeButton(
          color: AppColors.kblue,
          text: "Savs Card ",
          textColor: AppColors.kWhite,
        ),
      ),
    ]);
  }
}

