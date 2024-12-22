import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2.0,
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
