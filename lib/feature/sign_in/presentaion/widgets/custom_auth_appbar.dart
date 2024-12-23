import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
    this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: 16.h),
        AppBar(
          elevation: 0,
          surfaceTintColor: Colors.white,
          backgroundColor: AppColors.kWhite,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child:  Row(
              children: [
                Expanded(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF414141),
                  ),
                ),
                Text(
                AppLocalizations.of(context)!.back  ,
                  style: TextStyle(
                    color: AppColors.kDarkGray2,
                    fontSize: 16.r,
                  ),
                ),
              ],
            ),
          ),
          title: title != null
              ? Text(
                  title!,
                  style:  TextStyle(
                    color: AppColors.kDarkGray2,
                    fontSize: 16.r,
                  ),
                )
              :0.verticalSpace
        ),
      ],
    );
  }
}
