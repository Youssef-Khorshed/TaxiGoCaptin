import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/Utils/assets/icons.dart';
import '../../../../core/Utils/colors/colors.dart';
import 'alerts.dart';



class UserEarningDeails extends StatelessWidget {
  const UserEarningDeails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/profile_image.png")),
        title: const Text(
          'Hello mohamed',
          style: TextStyle(color: AppColors.kgrey, fontSize: 12),
        ),
        subtitle: const Text(
          "iraq",
          style: TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
            onPressed: () {
              Alerts.showMassage(context,
                  "Warning: \n  You cannot make any trip unless you have at least 500 dinars in your wallet");
            },
            icon: SvgPicture.asset(AppIcons.notificationIcon, height: 24)),
      ),
    );
  }
}
