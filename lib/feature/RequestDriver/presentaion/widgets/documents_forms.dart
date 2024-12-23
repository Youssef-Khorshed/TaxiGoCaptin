// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/documents_form_row.dart';

// class DocumentsForms extends StatefulWidget {
//   @override
//   _DocumentsFormsState createState() => _DocumentsFormsState();
// }

// class _DocumentsFormsState extends State<DocumentsForms> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void submitForm() {
//     if (_formKey.currentState!.validate()) {
//       //  type here

//       // Handle form submission logic here
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text('Form submitted: $vehicleModel, $vehicleColor')),
//       // );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: 20.h,
//           children: [
//             DocumentsFormRow(
//               label: AppLocalizations.of(context)!.vehicle_model,
//               onChanged: (value) {},
//             ),
//             DocumentsFormRow(
//               label: AppLocalizations.of(context)!.vehicle_color,
//               onChanged: (value) {},
//             ),
//             DocumentsFormRow(
//               label: AppLocalizations.of(context)!.vehicle_number,
//               onChanged: (value) {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
