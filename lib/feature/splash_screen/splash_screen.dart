import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../Core/Utils/Network/Services/secure_token.dart';
import '../../core/Utils/assets/images.dart';
import '../../core/Utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14129B),
      body: Center(
        child: FadeIn(
          duration: const Duration(seconds: 3),
          child: Image.asset(
            AppImages.imageicon,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  navigateToHome() async {
    var token = await SecureToken.getToken();
    if (token != null) {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    }
    else {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, Routes.welcomeRoute);
      });
    }
  }

}
