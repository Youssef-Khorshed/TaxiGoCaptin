import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushNamed(context, Routes.homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14129B),
      body: Center(
        child: FadeIn(
          duration: const Duration(seconds: 3),
          child: Image.asset(
            AssetImagesconst.imageicon,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
