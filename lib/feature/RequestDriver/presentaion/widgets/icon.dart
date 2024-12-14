import 'package:flutter/material.dart';
import 'add_photo.dart';
import 'dart:io';

class CustomIcon extends StatefulWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  File? _selectedImage;

  void _updateIcon(File? image) {
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: _selectedImage == null
            ? Colors.grey[300]
            : const Color.fromARGB(255, 54, 16, 206),
      ),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return AddPhoto(
                onImageSelected: _updateIcon,
              );
            },
          );
        },
        icon: Icon(
          _selectedImage == null
              ? Icons.file_upload_outlined
              : Icons.done,
          size: 30,
          color: _selectedImage == null
              ? Colors.black
              : Colors.green,
        ),
      ),
    );
  }
}
