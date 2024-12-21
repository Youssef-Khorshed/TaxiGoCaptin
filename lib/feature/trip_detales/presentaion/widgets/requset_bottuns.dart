import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';

class RequestButtons extends StatelessWidget {
  const RequestButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnappingSheetCubit, SnappingSheetState>(
      builder: (context, state) {
        var cubit = context.read<SnappingSheetCubit>();
        return Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: CostumeButton(
                onPressed: () {
                  cubit.accept();
                },
                text: "Cancel",
                color: Colors.white,
                textColor: Colors.red,
                borderColor: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: CostumeButton(
                onPressed: () {
                  cubit.accept();
                },
                text: "Accept",
                color: AppColors.kblue,
                textColor: AppColors.kWhite,
              ),
            ),
          ],
        );
      },
    );
  }
}
