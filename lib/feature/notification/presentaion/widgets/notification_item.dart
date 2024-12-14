import 'package:flutter/material.dart';

import '../../../../core/Utils/text.dart';

class CustomNotificationItem extends StatefulWidget {
  const CustomNotificationItem(
      {super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  State<CustomNotificationItem> createState() => _CustomNotificationItemState();
}

class _CustomNotificationItemState extends State<CustomNotificationItem> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: _toggleSelection,
        child: Container(
          decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                    blurRadius: 9,
                    color: isSelected
                        ? Colors.black.withOpacity(0.07)
                        : Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 3.6),
                    blurStyle: BlurStyle.inner)
              ],
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.4),
                  side: const BorderSide(color: Colors.transparent))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 12, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: 16,
                  colorText:
                      isSelected ? Colors.black : Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: widget.body,
                  fontSize: 16,
                  colorText:
                      isSelected ? Colors.black : Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
