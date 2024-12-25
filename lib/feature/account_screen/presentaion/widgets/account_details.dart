import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';
import '../../../../core/Utils/routes/routes.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 40.r,
            backgroundImage: AssetImage(Assets.imagesDriverImage),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frank Smith',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '9b6f6@example.com',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Assets.iconsPhone,
                      height: 15,
                    ),
                  ),
                  const Text('01110019643'),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.editProfileScreen);
          },
          icon: SvgPicture.asset(
            Assets.iconsEdit,
            height: 40,
          ),
        ),
      ],
    );
  }
}
