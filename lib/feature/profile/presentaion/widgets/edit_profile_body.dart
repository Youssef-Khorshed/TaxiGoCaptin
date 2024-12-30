import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/custom_text_field.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/widgets/profile_image_widget.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/widgets/rating_widget.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(
        height: 40,
      ),
      const ProfileImageWidget(),
      const SizedBox(height: 15),
      RatingWidget(),
      Column(children: [
        CustomTextField(
          suffixIcon: Icon(Icons.person),
          label: "Mohamed Haggag",
          onChanged: (String) {},
        ),
        CustomTextField(
          suffixIcon: const Icon(Icons.email),
          label: "haggag987@gmail.com",
          onChanged: (String) {},
        ),
        CustomTextField(
          suffixIcon: const Icon(Icons.phone),
          label: "+27-1234 4158",
          onChanged: (String) {},
        ),
      ]),
    ]);
  }
}
