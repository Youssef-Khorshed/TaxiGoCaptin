import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/routes/routes.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.imagesMap),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            right: MediaQuery.of(context).size.width * 0.15,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.mabScreen);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Text(
                      "Choose Your Request ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
