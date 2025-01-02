import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';

class CustomDriverdetailsHistory extends StatelessWidget {
  const CustomDriverdetailsHistory(
      {super.key, required this.price, required this.captainData});
  final CaptainData captainData;
  final String price;

  @override
  Widget build(BuildContext context) {
    return _buildDriverDetails(context);
  }

  Widget _buildDriverDetails(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.grayColor,
        radius: 20.r,
        backgroundImage: NetworkImage(
          captainData.picture ??
              'https://r2-us-west.photoai.com/1725044540-0740bf41f0465a6d0ef030a85d1f270a-1.png',
        ),
      ),
      title: AutoSizeText(
        captainData.name ?? '',
        style: AppStyles.style18BlackW500,
        maxLines: 1,
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.star, size: 16, color: AppColors.amberColor),
          horizontalSpace(3),
          AutoSizeText(
            captainData.rate ?? '',
            style: AppStyles.style14GrayW500,
            maxLines: 1,
          ),
        ],
      ),
      trailing: _buildPrice(context),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          AppLocalizations.of(context)!.price,
          style: AppStyles.style14BlackW500.copyWith(fontSize: 12.sp),
        ),
        verticalSpace(3),
        Text(
          ' $price ${AppLocalizations.of(context)!.iqd}',
          style: AppStyles.style14DarkgrayW500,
        ),
      ],
    );
  }
}
