import 'package:flutter/material.dart';

import 'mission_item.dart';

class MissionList extends StatelessWidget {
  const MissionList({
    super.key,
  });

  static const List<String> missions = [
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
    "Reach to 50 Completed trips",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: missions.length,
        itemBuilder: (context, index) {
          return MissionItem(title: missions[index]);
        },
      ),
    );
  }
}
