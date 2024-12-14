import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../forgot_password_page.dart';
import 'CustomTextField_1.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController Passwordcontroller = TextEditingController();

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign in',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2A2A2A),
            ),
          ),
          const SizedBox(height: 30),
          CustomTextField2(
            label: 'Email or Phone Number',
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          CustomTextField2(
            label: 'Enter Your Password',
            isPassword: true,
            onChanged: (value) {
              Passwordcontroller.text = value;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.confirmMobileOrEmail);

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => // OtpScreen()
                //           ForgotPassword(emailOrPhone: "hoouda19@gmail.com"),
                //     ));
              },
              child: Text(
                'Forget password?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFF44336),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, Routes.homeRoute);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D1AD8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Sign In',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
