import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/Utils/spacing/vertspace.dart';
import '../../../../core/Utils/text_styles/styles.dart';

class WithdrawalDepositTextWidget extends StatelessWidget {
  final bool isDeposit;
  final String? deposit, withdrawal;
  final String? amount;
  const WithdrawalDepositTextWidget(
      {super.key,
      required this.isDeposit,
      this.deposit,
      this.withdrawal,
      this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isDeposit
            ? AutoSizeText(
                deposit ?? AppLocalizations.of(context)!.deposit_processing,
                style: AppStyles.style16BlackW600,
              )
            : AutoSizeText(
                withdrawal ??
                    AppLocalizations.of(context)!.withdrawal_processing,
                style: AppStyles.style18BlackW600,
              ),
        verticalSpace(5),
        Row(
          children: [
            AutoSizeText(
              amount ?? AppLocalizations.of(context)!.no_amount,
              style: AppStyles.style18BlueBold,
            ),
            horizontalSpace(5),
            AutoSizeText(
              AppLocalizations.of(context)!.currency_iqd,
              style: AppStyles.style12DarkgrayW400,
            ),
          ],
        ),
      ],
    );
  }
}
