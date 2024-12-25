import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.selectedImage});

  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: selectedImage == null
            ? Colors.grey[300]
            : const Color.fromARGB(255, 54, 16, 206),
      ),
      child: IconButton(
        onPressed: null,
        icon: Icon(
          selectedImage == null ? Icons.file_upload_outlined : Icons.done,
          size: 30,
          color: selectedImage == null ? Colors.black : Colors.green,
        ),
      ),
    );
  }
}
