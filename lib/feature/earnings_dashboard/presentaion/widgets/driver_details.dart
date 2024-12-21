import 'package:flutter/material.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/driver_image.jpg"),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mohamed Haggag",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("15 Min", style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 8),
                    Icon(Icons.star, size: 14, color: Colors.amber),
                    Text("4.0", style: TextStyle(color: Colors.grey)),
                    Spacer(),
                    Text("2.4km", style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 15),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}