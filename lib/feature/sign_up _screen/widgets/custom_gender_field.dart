import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/Utils/colors/colors.dart';

class CustomGenderField extends StatefulWidget {
  final String label;
  final String? selectedGender;
  final ValueChanged<String?> onChanged;
  final List<String> genderOptions;
  const CustomGenderField({
    super.key,
    required this.label,
    this.selectedGender,
    required this.onChanged,
    required this.genderOptions,
  });

  @override
  State<CustomGenderField> createState() => _CustomGenderFieldState();
}

class _CustomGenderFieldState extends State<CustomGenderField> {
  late String _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.selectedGender ?? '${widget.label}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedGender == 'Gender' ? widget.label : _selectedGender,
              style: TextStyle(
                color: _selectedGender == 'Gender' ? Colors.grey : Colors.black,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10),
                icon: const Icon(FontAwesomeIcons.chevronDown, size: 14),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                    widget.onChanged(newValue);
                  }
                },
                items: widget.genderOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
