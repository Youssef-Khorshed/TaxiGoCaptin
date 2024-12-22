import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/text_styles/styles.dart';
import 'widgets/notification_list_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: AutoSizeText(
          AppLocalizations.of(context)!.notifications,
          style: AppStyles.style20BlackW500,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: const NotificationListWidget(),
      ),
    );
  }
}
