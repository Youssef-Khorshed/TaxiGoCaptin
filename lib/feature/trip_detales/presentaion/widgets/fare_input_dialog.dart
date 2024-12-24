// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
// import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
// import 'package:taxi_go_driver/feature/trip_detales/controllers/pay_after_ride_controller/pay_after_ride_cubit.dart';
//
// class FareInputField extends StatelessWidget {
//   final TextEditingController controller;
//
//   const FareInputField({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: AppColors.kblue,
//             width: 1.0,
//           ),
//         ),
//         labelText: AppLocalizations.of(context)!.fare,
//         hintText: AppLocalizations.of(context)!.enter_the_fare_value,
//         border: OutlineInputBorder(),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return AppLocalizations.of(context)!.please_enter_the_fare_value;
//         }
//         if (double.tryParse(value) == null) {
//           return AppLocalizations.of(context)!.please_enter_a_valid_number;
//         }
//         return null;
//       },
//     );
//   }
// }
//
// void handleFareInput(BuildContext context, TextEditingController controller) {
//   final fareValue = controller.text;
//   if (fareValue.isEmpty) {
//     Fluttertoast.showToast(
//       msg: AppLocalizations.of(context)!.please_enter_the_fare_value,
//     );
//     return;
//   }
//
//   final fare = double.tryParse(fareValue);
//   if (fare == null) {
//     Fluttertoast.showToast(
//       msg: AppLocalizations.of(context)!.please_enter_a_valid_number,
//     );
//     return;
//   }
//
//   // إغلاق لوحة المفاتيح
// }
