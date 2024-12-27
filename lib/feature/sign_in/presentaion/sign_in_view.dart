import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/widgets/sign_in_form.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/widgets/social_login_button.dart';
import '../../../core/Utils/assets/icons.dart';
import '../../../core/Utils/routes/routes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAuthAppBar(),
                const SizedBox(height: 30),
                const SignInForm(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Color(0xFFB8B8B8),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        'or',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFB8B8B8),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Color(0xFFB8B8B8),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginButton(
                      iconPath: AppIcons.appleIcon,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 15),
                    SocialLoginButton(
                      iconPath: AppIcons.facebookIcon,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 15),
                    SocialLoginButton(
                      iconPath: AppIcons.gmailIcon,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff5A5A5A),
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1D1AD8),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushNamed(context, Routes.signUpRoute);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
