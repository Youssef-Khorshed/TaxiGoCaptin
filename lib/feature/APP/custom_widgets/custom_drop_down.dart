import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../core/Utils/colors/colors.dart';

// ignore: must_be_immutable
class CustomDropDownFormField extends StatefulWidget {
  final List<String> items;
  final String name;
  final Color? backgroundcolor;
  final Color bordercolor;
  final Color? iconEnabledColor;
  final Gradient? gradient;
  final TextStyle? nameTextStyle;
  const CustomDropDownFormField(
      {super.key,
      required this.items,
      required this.name,
      this.gradient,
      this.iconEnabledColor,
      this.nameTextStyle,
      this.bordercolor = AppColors.blackColor,
      this.backgroundcolor});

  @override
  State<CustomDropDownFormField> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: const SizedBox(),
      isExpanded: true,
      iconStyleData: IconStyleData(iconEnabledColor: widget.iconEnabledColor),
      buttonStyleData: ButtonStyleData(
        decoration: BoxDecoration(
            gradient: widget.gradient,
            color: widget.backgroundcolor,
            border: Border.all(color: widget.bordercolor, width: 1),
            borderRadius: BorderRadius.circular(10)),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        useSafeArea: true,
      ),
      hint: Text(
        selectedValue ?? widget.name,
        style: widget.nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: widget.items
          .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
