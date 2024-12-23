import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

   CustomTextField({this.validator,
    super.key,
    required this.label,
    this.controller,
  });
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.grey),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
