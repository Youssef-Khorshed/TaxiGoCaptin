import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletMethodCard extends StatefulWidget {
  const WalletMethodCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WalletMethodCardState createState() => _WalletMethodCardState();
}

class _WalletMethodCardState extends State<WalletMethodCard> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2.w,
          ),
        ),
        child: Row(
          children: [
            Radio(
              value: true,
              groupValue: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                });
              },
              activeColor: Colors.blue,
            ),
            Image.asset('assets/images/zaincash.png')
          ],
        ),
      ),
    );
  }
}
