import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../APP/custom_widgets/custom_text.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.name, required this.icon, required this.onTap});
  final VoidCallback onTap;
  final String name;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: ListTile(
          leading: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(AppColors.blueColor, BlendMode.srcIn),
          ),
          title: CustomText(text: name),
        ),
      ),
    );
  }
}
