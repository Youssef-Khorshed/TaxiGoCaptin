import 'package:flutter/material.dart';

import 'icon.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 18),
      child: ListTile(
        onTap: () {},
        onLongPress: () {
          print("Tile long-pressed");
        },
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "download the document",
          style: TextStyle(color: Colors.grey[600], fontSize: 15),
        ),
        trailing: const CustomIcon(),
      ),
    );
  }
}
