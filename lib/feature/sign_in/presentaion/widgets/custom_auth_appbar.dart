import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
    this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        AppBar(
          elevation: 0,
          surfaceTintColor: Colors.white,
          backgroundColor: AppColors.kWhite,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Row(
              children: [
                Expanded(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF414141),
                  ),
                ),
                Text(
                  'Back',
                  style: TextStyle(
                    color: Color(0xFF414141),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          title: title != null
              ? Text(
                  title!,
                  style: const TextStyle(
                    color: Color(0xFF414141),
                    fontSize: 16,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
