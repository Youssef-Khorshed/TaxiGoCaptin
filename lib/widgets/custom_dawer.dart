import 'package:flutter/material.dart';

import '../core/Utils/colors/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      color: AppColors.kWhite,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.closeDrawer();
            },
            child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      color: AppColors.kPrimaryColor,
                    ))),
          ),
          const SizedBox(
            height: 78,
          ),
        ],
      ),
    );
  }
}
