
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../data/models/get_cities_model/Cities.dart';
import '../../data/models/get_districts_by_cities/Cities.dart';

// ignore: must_be_immutable
class CustomDropDownFormField2 extends StatefulWidget {
  final List<DistricCities> items;
  final String name;
  final Color? backgroundcolor;
  final Color bordercolor;
  final Color? iconEnabledColor;
  final Gradient? gradient;
  final TextStyle? nameTextStyle;
  void Function(DistricCities?)? onChanged;
   CustomDropDownFormField2(
      {super.key,
        this.onChanged,
        required this.items,
        required this.name,
        this.gradient,
        this.iconEnabledColor,
        this.nameTextStyle,
        this.bordercolor = AppColors.blackColor,
        this.backgroundcolor});

  @override
  State<CustomDropDownFormField2> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField2> {
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
            border: Border.all(color: widget.bordercolor, width: 1.w),
            borderRadius: BorderRadius.circular(10.r)),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        useSafeArea: true,
      ),
      hint: Text(
        selectedValue ?? widget.name,
        style: widget.nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: widget.items
          .map((gender) =>
          DropdownMenuItem(value: gender, child: Text(gender.district!)))
          .toList(),
      onChanged: (value) {
        print("R");
        widget.onChanged!(value);

        setState(() {

          selectedValue = value!.district!;
        });
      },
    );
  }
}

// ignore: must_be_immutable
class CustomDropDownFormField3 extends StatefulWidget {
  final List<Cities> items;
  final String name;
  final Color? backgroundcolor;
  final Color bordercolor;
  final Color? iconEnabledColor;
  final Gradient? gradient;
  final TextStyle? nameTextStyle;
  void Function(Cities?)? onChanged;
  CustomDropDownFormField3(
      {super.key,
        this.onChanged,
        required this.items,
        required this.name,
        this.gradient,
        this.iconEnabledColor,
        this.nameTextStyle,
        this.bordercolor = AppColors.blackColor,
        this.backgroundcolor});

  @override
  State<CustomDropDownFormField3> createState() =>
      _CustomDropDownFormFieldState3();
}

class _CustomDropDownFormFieldState3 extends State<CustomDropDownFormField3> {
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
            border: Border.all(color: widget.bordercolor, width: 1.w),
            borderRadius: BorderRadius.circular(10.r)),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        useSafeArea: true,
      ),
      hint: Text(
        selectedValue ?? widget.name,
        style: widget.nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: widget.items
          .map((gender) =>
          DropdownMenuItem(value: gender, child: Text(gender.city!)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value!.city;
          widget.onChanged!(value);
        });
      },
    );
  }
}
