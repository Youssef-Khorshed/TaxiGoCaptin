import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import 'walle_form_field_validator.dart';

class WalletContentOfDialogWidget extends StatelessWidget {
  final TextEditingController? amountController;
  const WalletContentOfDialogWidget({super.key, this.amountController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppFormField(
          suffixIcon: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
            height: 20.h,
            width: 20.w,
            child: AutoSizeText(AppLocalizations.of(context)!.currency_iqd,
                style: AppStyles.style14DarkgrayW500),
          ),
          isNumbers: true,
          validator: (value) => WalletFormFieldValidator.numbers(value),
          controller: amountController,
          hintText: AppLocalizations.of(context)!.enter_amount,
          prefixIcon: SizedBox(
            height: 50.h,
            width: 50.w,
            child: Image.asset(
              AssetImagesconst.zainCashImage,
              height: 50.h,
              width: 50.w,
            ),
          ),
        ),
      ],
    );
  }
}
