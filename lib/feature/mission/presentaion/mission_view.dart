import 'package:flutter/material.dart';

import 'package:taxi_go_driver/feature/mission/presentaion/widgets/mission_list.dart';

import '../../history/presentaion/widgets/custom_background_appbar.dart';

class MissionView extends StatelessWidget {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundAppBar(
      appBarTitle: "Missions",
      widget: Padding(
        padding: EdgeInsets.fromLTRB(21, 44, 21, 20),
        child: MissionList(),
      ),
    );
  }
}
