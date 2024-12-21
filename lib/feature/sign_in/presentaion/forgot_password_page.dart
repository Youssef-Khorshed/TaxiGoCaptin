import 'package:flutter/material.dart';

import '../../../core/Utils/colors/colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        title: const Text("Forgot Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select which contact details should we use to reset your password",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ContactOption(
              title: "Via SMS",
              details: "***** ***70",
              icon: Icons.message,
              onTap: () {
                // Handle SMS option
              },
            ),
            const SizedBox(height: 16),
            ContactOption(
              title: "Via Email",
              details: "*****@xyz.com",
              icon: Icons.email,
              onTap: () {
                // Handle Email option
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kblue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactOption extends StatelessWidget {
  final String title;
  final String details;
  final IconData icon;
  final VoidCallback onTap;

  const ContactOption({
    super.key,
    required this.title,
    required this.details,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.kblue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.kblue),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18)),
                    Text(details, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const Icon(Icons.chevron_right, color: AppColors.kblue),
          ],
        ),
      ),
    );
  }
}
