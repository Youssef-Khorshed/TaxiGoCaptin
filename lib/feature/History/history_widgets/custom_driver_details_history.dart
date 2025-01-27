import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class CustomDriverdetailsHistory extends StatelessWidget {
  const CustomDriverdetailsHistory({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return _buildDriverDetails(context);
  }

  Widget _buildDriverDetails(BuildContext context) {
    return _buildPrice(context);
  }

  Widget _buildPrice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            AppLocalizations.of(context)!.price,
            style: AppStyles.style14BlackW500.copyWith(fontSize: 12.sp),
          ),
          Text(
            ' $price ${AppLocalizations.of(context)!.iqd}',
            style: AppStyles.style14DarkgrayW500,
          ),
        ],
      ),
    );
  }
}
