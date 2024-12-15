import 'package:flutter/material.dart';

import '../../core/Utils/colors/colors.dart';
import '../../core/Utils/routes/routes.dart';
import '../APP/custom_widgets/custom_text.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14129B),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            Image.asset('assets/images/car.png'),
            const SizedBox(height: 20),
            GestureDetector(
              child: const Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Text(
              'Have a better sharing experience',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signUpRoute);
                },
                height: 50,
                child: const CustomText(
                  text: "Create an account",
                  colorText: AppColors.kblue,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInRoute);
                },
                height: 50,
                child: const CustomText(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  colorText: Colors.white,
                  text: "Log In",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
