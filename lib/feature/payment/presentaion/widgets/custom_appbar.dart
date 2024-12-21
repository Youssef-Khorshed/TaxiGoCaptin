import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';

class CustomAppbar extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  const CustomAppbar({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: onPressed, icon: icon),
      title: const Text(
        'Wallet ',
        style: TextStyle(
          fontFamily: Constants.kModelFont,
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
