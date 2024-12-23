import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialIcon(
          icon: Icons.mail,
          color: Colors.red,
          onPressed: () {
            print("Gmail button pressed");
          },
        ),
         SizedBox(width: 16.w),
        buildSocialIcon(
          icon: Icons.facebook,
          color: Colors.blue,
          onPressed: () {
            print("Facebook button pressed");
          },
        ),
        const SizedBox(width: 16),
        buildSocialIcon(
          icon: Icons.apple,
          color: Colors.black,
          onPressed: () {
            print("Apple button pressed");
          },
        ),
      ],
    );
  }

  Widget buildSocialIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 1.w,
          ),
        ),
        child: Icon(
          icon,
          color: color,
          size: 24.r,
        ),
      ),
    );
  }
}
