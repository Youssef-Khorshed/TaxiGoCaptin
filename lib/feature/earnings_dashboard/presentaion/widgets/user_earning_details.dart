import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/Core/Utils/routes/routes.dart';

import '../../../../core/Utils/Network/Services/secure_profile.dart';
import '../../../../core/Utils/assets/icons.dart';
import '../../../../core/Utils/assets/images.dart';
import '../../../../core/Utils/colors/colors.dart';
import 'alerts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserEarningDeails extends StatefulWidget {
  const UserEarningDeails({
    super.key,
  });

  @override
  State<UserEarningDeails> createState() => _UserEarningDeailsState();
}

class _UserEarningDeailsState extends State<UserEarningDeails> {
  String? name;

  String? image;

  void initState() {
    imageAndName();
    super.initState();
  }

  Future<void> imageAndName() async {
    image = await SecureProfile.getProfileImage();
    name = await SecureProfile.getProfileName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.profileRoute);
          },
          child: CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.white,
              backgroundImage: image != null && image != ""
                  ? NetworkImage(image!)
                  : const AssetImage(
                      AppImages.imagesProfileImage,
                    )),
        ),
        title: Text(
          '${AppLocalizations.of(context)!.hello} ${name?.split(" ")[0]}',
          style: TextStyle(color: AppColors.kgrey, fontSize: 12.sp),
        ),
        subtitle: Text(
          AppLocalizations.of(context)!.iraq,
          style: TextStyle(fontSize: 12.sp),
        ),
        trailing: IconButton(
            onPressed: () {
              Alerts.showMassage(
                  context, AppLocalizations.of(context)!.unless500);
            },
            icon: SvgPicture.asset(AppIcons.notificationIcon, height: 24.h)),
      ),
    );
  }
}
