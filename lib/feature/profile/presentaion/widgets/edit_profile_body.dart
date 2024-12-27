import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/widgets/profile_image_widget.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/widgets/rating_widget.dart';
import 'costum_text_faild.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      SizedBox(
        height: 40,
      ),
      ProfileImageWidget(),
      SizedBox(height: 15),
      RatingWidget(),
      Column(children: [
        CostumeTextField(
          icon: Icons.person,
          text: "Mohamed Haggag",
        ),
        CostumeTextField(
          icon: Icons.email,
          text: "haggag987@gmail.com",
        ),
        CostumeTextField(
          icon: Icons.phone,
          text: "+27-1234 4158",
        ),
      ]),
    ]);
  }
}
