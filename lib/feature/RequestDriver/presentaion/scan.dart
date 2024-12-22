import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../APP/custom_widgets/custom_Button.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
      _performIscan();
    }
  }

  void _performIscan() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          "Scan Driving License",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    height: 200,
                  )
                : Image.asset("assets/scan.jpg"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.flashlight_on_outlined),
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: _pickImage,
                ),
              ],
            ),
            const Spacer(),
            CustomAppBottom(
              onPressed: () {},
              buttonText: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
