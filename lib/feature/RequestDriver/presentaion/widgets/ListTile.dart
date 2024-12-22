import 'dart:io';

import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/add_photo.dart';

import 'icon.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {super.key, required this.title, this.notDoneYet = true});
  final bool notDoneYet;
  final String title;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  File? selectedImage;

  void _updateIcon(File? image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.notDoneYet
            ? Container()
            : Text(AppLocalizations.of(context)!.complete_other_field,
                style: AppStyles.text14Size500WightRed),
        Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 18),
          child: ListTile(
            onTap: () {
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
            title: Text(
              widget.title,
              style: AppStyles.text16Size400darkGrey,
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.download_the_document,
              style: AppStyles.text14Size500White,
            ),
            trailing: CustomIcon(
              selectedImage: selectedImage,
            ),
          ),
        ),
      ],
    );
  }
}
