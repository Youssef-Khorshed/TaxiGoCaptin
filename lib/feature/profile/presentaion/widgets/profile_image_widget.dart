import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(),
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage(AppImages.imagesDriverImage),
          ),
        ),
        Positioned(
          bottom: 10,
          right: MediaQuery.of(context).size.width * 0.3,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.blueAccent),
            child: Icon(Icons.camera_alt_outlined),
          ),
        )
      ],
    );
  }
}
