import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/Utils/spacing/vertspace.dart';
import '../../../../core/Utils/text_styles/styles.dart';



class WithdrawalDepositTimeWidget extends StatelessWidget {
  final DateTime dateTime;

  const WithdrawalDepositTimeWidget({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('hh:mm a').format(dateTime);
    final date = DateFormat('dd/MM/yyyy').format(dateTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AutoSizeText(
          time,
          style: AppStyles.style12DarkgrayW400,
        ),
        verticalSpace(10),
        AutoSizeText(
          date,
          style: AppStyles.style12DarkgrayW400,
        ),
      ],
    );
  }
}
