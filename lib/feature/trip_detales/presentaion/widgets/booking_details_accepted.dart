import 'package:flutter/material.dart';

class BookingDetailsAccepted extends StatelessWidget {
  const BookingDetailsAccepted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Distance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "1.4 km",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            children: [
              Text(
                "Tima",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "6 Min",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
