import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/Utils/assets/assets.dart';
import '../../../../core/Utils/colors/colors.dart';

class CancelButtonAccepted extends StatefulWidget {
  const CancelButtonAccepted({
    super.key,
    required this.onCancel, // Add a callback for cancellation
    required this.width,
    required this.isAccepted,
  });

  final double width;
  final bool isAccepted;
  final VoidCallback onCancel; // Callback to handle cancellation

  @override
  State<CancelButtonAccepted> createState() => _CancelButtonAcceptedState();
}

class _CancelButtonAcceptedState extends State<CancelButtonAccepted> {
  bool _isAccepted = false; // Move state management inside the State class

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAccepted = !_isAccepted;
          log('Cancellation state: $_isAccepted');
        });
        widget.onCancel(); // Call the provided callback
      },
      child: Container(
        width: widget.width * 0.9,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.kReadCancel,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              SvgPicture.asset(
                Assets.iconsCancel,
                width: 24, // Add a specific width if needed
                height: 24, // Add a specific height if needed
              ),
              const SizedBox(
                  width: 10), // Add some spacing between icon and text
              Text(
                AppLocalizations.of(context)!.cancel_booking,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
