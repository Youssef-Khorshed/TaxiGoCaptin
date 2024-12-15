import 'package:flutter/material.dart';

class LocationRow extends StatelessWidget {
  final String text;
  final String time;

  const LocationRow({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
