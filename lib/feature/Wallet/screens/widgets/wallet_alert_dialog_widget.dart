import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Utils/Network/Services/services_locator.dart';
import '../../../../core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../../core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../../../core/Utils/assets/images.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import '../../../APP/custom_widgets/custom_ErrorAnimation.dart';
import '../../controller/wallet_deposit_cubit/deposit_cubit.dart';
import 'walle_form_field_validator.dart';

class WalletAlertDialogWidget extends StatelessWidget {
  const WalletAlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletCubit>(),
      child: BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {
          if (state is WalletSuccess) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          final walletCubit = context.read<WalletCubit>();
          return Form(
            key: walletCubit.formKey,
            child: SizedBox(
              width: 600.w,
              height: 000.h,
              child: AlertDialog(
                actionsPadding:
                    EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                actionsAlignment: MainAxisAlignment.start,
                backgroundColor: AppColors.whiteColor,
                scrollable: true,
                actions: [
                  if (state is WalletLoading) ...[
                    const Center(child: CircularProgressIndicator()),
                  ] else if (state is WalletError) ...[
                    CustomErroranimation(
                      errormessage: "An error occurred while processing.",
                      lottie: "lottie_path",
                    ),
                  ] else ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomAppBottom(
                          buttonText: "Add Money",
                          width: 100.w,
                          borderCornerRadius: 12.r,
                          onPressed: () async {
                            if (walletCubit.formKey.currentState!.validate()) {
                              await walletCubit.handleAddMoney(
                                context: context,
                                amount:
                                    walletCubit.amountController.text.trim(),
                              );
                            }
                          },
                        ),
                        CustomAppBottom(
                          buttonText: "Cancel",
                          width: 100.w,
                          borderCornerRadius: 12.r,
                          borderColor: AppColors.redColor,
                          buttonColor: AppColors.redColor.withAlpha(20),
                          textColor: AppColors.redColor,
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ],
                content: Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomAppFormField(
                        suffixIcon: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 12.h),
                          height: 20.h,
                          width: 20.w,
                          child: AutoSizeText("IQD",
                              style: AppStyles.style14DarkgrayW500),
                        ),
                        isNumbers: true,
                        validator: (value) =>
                            WalletFormFieldValidator.numbers(value),
                        controller: walletCubit.amountController,
                        hintText: "Enter Amount",
                        prefixIcon: Image.asset(
                          AssetImagesconst.zainCashImage,
                          height: 50.h,
                          width: 50.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
