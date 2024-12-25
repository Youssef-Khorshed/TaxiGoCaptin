import 'dart:io';

import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/models/captain_documents_model.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/add_photo.dart';

import 'icon.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.dataComplete = true,
    required this.selectedImage,
    // required this.captainDocumentsModel
  });
  final Function(File?) selectedImage;
  final bool dataComplete;
  final String title;

  // final CaptainDocumentsModel captainDocumentsModel;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  File? selectedImage;

  void _updateIcon(File? image) {
    setState(() {
      selectedImage = image;
    });
    widget.selectedImage(selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectedImage == null
            ? Container()
            : Image.file(
                selectedImage!,
                height: 50.h,
              ),
        horizontalSpace(10.h),
        selectedImage == null
            ? widget.dataComplete
                ? Container()
                : Text(AppLocalizations.of(context)!.complete_other_field,
                    style: AppStyles.text14Size500WightRed)
            : Container(),
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
              style: AppStyles.style14WhiteW500,
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
