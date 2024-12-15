import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Alerts {
  static showMassage(BuildContext context, String msg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent.withOpacity(.6),
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/alert.svg",
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  msg,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
