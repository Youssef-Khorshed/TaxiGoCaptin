import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/widgets/custom_gender_field.dart';

import '../../../../core/Utils/routes/routes.dart';
import '../../../sign_in/presentaion/widgets/custom_text_field.dart';
import '../../../sign_up _screen/widgets/phone_number_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 121,
            height: 121,
            decoration: const BoxDecoration(
              color: Color(0xFFD0D0D0),
              shape: BoxShape.circle,
            ),
            child: const Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff1D1AD8),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomTextField(label: 'Full Name', onChanged: (value) {}),
          const SizedBox(height: 20),
          const PhoneNumberFailed(),
          CustomTextField(label: 'Email', onChanged: (value) {}),
          const SizedBox(height: 20),
          CustomTextField(label: 'Street', onChanged: (value) {}),
          const SizedBox(height: 20),
          CustomGenderField(
            genderOptions: const ["ANBAR", "KERBALA"],
            label: 'City',
            onChanged: (String? value) {},
          ),
          const SizedBox(height: 20),
          CustomGenderField(
            genderOptions: const ["Amara", "Hashimiya"],
            label: 'District',
            onChanged: (String? value) {},
          ),
          const SizedBox(height: 30),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF1D1AD8)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xFF414141),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.uploadDocument);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => EarningsDashboardScreen(),
              //     ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D1AD8),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
