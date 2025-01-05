import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/secure_profile.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

Future<AppBar> drawerAppBar({required String name}) async {
  final String? image = await SecureProfile.getProfileImage();

  return AppBar(
    backgroundColor: AppColors.whiteColor,
    title: Text(
      name,
      style: AppStyles.style16BlackW600,
    ),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..scale(-1.0, 1.0), // Mirror horizontally
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(
                AppIcons.iconsListIcon,
                height: 50.h,
              ),
            ),
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 25.r,
          backgroundColor: Colors.white,
          backgroundImage: image != null && image.isNotEmpty
              ? NetworkImage(image) as ImageProvider
              : const AssetImage(AppImages.imagesProfileImage) as ImageProvider,
        ),
      ),
      horizontalSpace(10.w),
    ],
  );
}
