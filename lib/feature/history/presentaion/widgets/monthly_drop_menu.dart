import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/Utils/assets/images.dart';
import '../../../../core/Utils/colors/colors.dart';

class MonthlyDropMenu extends StatefulWidget {
  const MonthlyDropMenu({super.key});

  @override
  State<MonthlyDropMenu> createState() => _MonthlyDropMenuState();
}

class _MonthlyDropMenuState extends State<MonthlyDropMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Container(
        height: 30,
        width: 100,
        decoration: ShapeDecoration(
            color: AppColors.kDropMenu,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: item,
                  dropdownColor: AppColors.kWhite,
                  borderRadius: BorderRadius.circular(10),
                  items: monthList
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      item = value!;
                    });
                  },
                ),
              ),
              const Spacer(),
              SizedBox(child: SvgPicture.asset(AppImages.dropMenu))
            ],
          ),
        ),
      ),
    );
  }
}

String item = "Today";
List<String> monthList = [
  "This Month",
  "This Week",
  "Today",
];
