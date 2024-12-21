import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/history/presentaion/widgets/custom_background_appbar.dart';
import 'package:taxi_go_driver/feature/history/presentaion/widgets/history_item.dart';
import 'package:taxi_go_driver/feature/history/presentaion/widgets/monthly_drop_menu.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundAppBar(
      actions: const [
        MonthlyDropMenu(),
      ],
      appBarTitle: "History",
      widget: Padding(
        padding: const EdgeInsets.fromLTRB(21, 44, 21, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return const HistoryItem(
                isCompleted: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
