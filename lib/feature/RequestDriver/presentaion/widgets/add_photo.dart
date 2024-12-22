import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class AddPhoto extends StatefulWidget {
  final Function(File?) onImageSelected;
  const AddPhoto({super.key, required this.onImageSelected});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.select_upload_option,
                      style: TextStyle(fontSize: 22),
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () => _pickImage(ImageSource.camera),
                        ),
                        horizontalSpace(10),
                        Text(AppLocalizations.of(context)!.scan_a_Photo),
                      ],
                    ),
                    const Divider(height: 1, indent: 5, endIndent: 5),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.image_search_outlined),
                          onPressed: () => _pickImage(ImageSource.gallery),
                        ),
                        horizontalSpace(10),
                        Text(AppLocalizations.of(context)!.choose_from_gallery),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(20),
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(22),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: AppStyles.text14Size500WightRed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
