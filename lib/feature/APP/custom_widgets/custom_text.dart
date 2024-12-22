import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../settings/Localization/Localizationcubit/localization_cubit.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    this.colorText,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.style,
    super.key,
    this.decoration,
  });

  final Color? colorText;
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        (state is ChangeLanguage && state.languageCode == 'en')
            ? GoogleFonts.poppins()
            : GoogleFonts.cairo();

        return Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: style,
        );
      },
    );
  }
}
