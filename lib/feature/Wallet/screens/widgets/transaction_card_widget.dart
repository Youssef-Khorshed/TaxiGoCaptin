import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'withdrawal_deposit_arrow_widget.dart';
import 'withdrawal_deposit_text_widget.dart';

import 'withdrawal_deposit_time_widget.dart';

class TransactionCardWidget extends StatelessWidget {
  final String paymentType, amount;
  final String dateTime;
  final bool inside;
  const TransactionCardWidget(
      {super.key,
      required this.paymentType,
      required this.dateTime,
      required this.inside,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.blueColor, width: .5.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WithdrawalDepositArrowWidget(
            inside: inside,
          ),
          horizontalSpace(20.h),
          WithdrawalDepositTextWidget(
            deposit: paymentType,
            isDeposit: true,
            amount: amount,
          ),
          const Spacer(),
          WithdrawalDepositTimeWidget(
            dateTime: DateTime.parse(dateTime),
          ),
        ],
      ),
    );
  }
}
