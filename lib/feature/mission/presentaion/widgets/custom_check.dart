import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/Utils/assets/images.dart';
import '../../../../core/Utils/colors/colors.dart';

class CustomCheck extends StatefulWidget {
  const CustomCheck({super.key});

  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        height: 30,
        width: 30,
        decoration: ShapeDecoration(
            color: isSelected != true
                ? AppColors.kblue.withOpacity(0.2)
                : const Color(0xff3366FF),
            shape: const CircleBorder()),
        child: Center(child: SvgPicture.asset(AssetImagesconst.check)),
      ),
    );
  }
}
