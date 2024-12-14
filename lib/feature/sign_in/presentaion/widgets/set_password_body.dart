import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/routes/routes.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import '../../../APP/custom_widgets/custom_Button.dart';
import '../../../APP/custom_widgets/custom_PasswordField.dart';
import '../../../APP/custom_widgets/custom_text.dart';

class SetPasswordBody extends StatelessWidget {
  SetPasswordBody({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF2A2A2A),
                  ),
                ),
                CustomText(
                  text: "Back",
                  style: AppStyles.textStyle16.copyWith(
                    color: const Color(0XFF414141),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Set Password",
            style: TextStyle(fontSize: 24.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomText(
            text: "Set your password",
            style: AppStyles.textStyle16,
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: PasswordField(
              hintText: "Enter Your Password",
              controller: passwordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: PasswordField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
            ),
          ),
          CustomText(
            text: "Atleast 1 number or a special character",
            style: AppStyles.textStyle16,
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: CustomButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.profileRoute,
                );
                // if (formKey.currentState!.validate()) {
                //
                // }
              },
              text: "Register",
            ),
          )
        ],
      ),
    );
  }
}
