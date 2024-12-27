import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/text_styles/styles.dart';



class UserNameContainer extends StatelessWidget {
  const UserNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(width: 5.w),

          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Color(0xff969696),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/alexu-a9210.appspot.com/o/Vector%20(1).png?alt=media&token=e4d896a0-ec30-4944-b798-8ce0845d0bdb",
                ),
                fit: BoxFit.contain,

              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "User_name",
                  style:AppStyles.text14Size500Wight
              ),

            ],
          ),
        ],
      ),
    );
  }
}
