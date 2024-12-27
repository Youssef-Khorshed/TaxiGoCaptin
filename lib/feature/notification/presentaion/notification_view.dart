import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/notification/presentaion/widgets/notifications_listview.dart';
import 'package:taxi_go_driver/widgets/default_appbar.dart';

import '../../../core/Utils/colors/colors.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: DefaultAppbar(
        title: "Notification",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 21, top: 20),
        child: Column(
          children: [
            NotificationsListView(),
          ],
        ),
      ),
    );
  }
}
