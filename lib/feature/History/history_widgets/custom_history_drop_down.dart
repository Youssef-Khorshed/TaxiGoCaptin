import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/feature/History/controller/history_view_model.dart';

class CustomHistoryDropDown extends StatefulWidget {
  final List<String> items;
  final Color? backgroundcolor;
  final Color bordercolor;
  final Color? iconEnabledColor;
  final Gradient? gradient;
  final TextStyle? nameTextStyle;

  const CustomHistoryDropDown({
    super.key,
    required this.items,
    this.gradient,
    this.iconEnabledColor,
    this.nameTextStyle,
    this.bordercolor = AppColors.blackColor,
    this.backgroundcolor,
  });

  @override
  State<CustomHistoryDropDown> createState() => _CustomHistoryDropDownState();
}

String? selectedValue;

class _CustomHistoryDropDownState extends State<CustomHistoryDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: const SizedBox(),
      isExpanded: true,
      iconStyleData: IconStyleData(iconEnabledColor: widget.iconEnabledColor),
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
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
      hint: AutoSizeText(
        selectedValue ?? AppLocalizations.of(context)!.this_month,
        style: widget.nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: widget.items
          .map((gender) =>
              DropdownMenuItem(value: gender, child: AutoSizeText(gender)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
          HistoryViewModel.get(context)
              .getHistoryData(context, tripHistory: value);
        });
      },
    );
  }
}
