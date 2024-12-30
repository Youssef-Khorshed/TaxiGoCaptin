// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';

// ignore: must_be_immutable
class RequestButtons extends StatelessWidget {
  RequestButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CostumeButton(
                onPressed: () {
                  context.read<MapsCubit>().canelRideRequest(context: context);
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                },
                height: 50.h,
                text: "Decline",
                color: Colors.red.withOpacity(.05),
                textColor: Colors.red,
                borderColor: Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CostumeButton(
                height: 50.h,
                text: "Accept Ride",
                textColor: AppColors.kWhite,
                color: AppColors.kblue,
                onPressed: () async {
                  await context
                      .read<MapsCubit>()
                      .pickCustomer(context: context);
                  context.read<MapsCubit>().arrivedToCustomer();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
