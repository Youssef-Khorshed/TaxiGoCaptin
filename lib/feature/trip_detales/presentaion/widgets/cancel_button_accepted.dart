import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/account_screen/presentaion/widgets/costume_bottun.dart';
import '../../../../core/Utils/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CancelButtonAccepted extends StatefulWidget {
  const CancelButtonAccepted({
    super.key,
    required this.onCancel,
    required this.width,
    required this.isAccepted,
  });

  final double width;
  final bool isAccepted;
  final VoidCallback onCancel;

  @override
  State<CancelButtonAccepted> createState() => _CancelButtonAcceptedState();
}

class _CancelButtonAcceptedState extends State<CancelButtonAccepted> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _isAccepted = !_isAccepted;
          });
          widget.onCancel();
        },
        child: Row(
          children: [
            Expanded(
              child: CostumeButton(
                height: 50.h,
                text: AppLocalizations.of(context)!.trip_complete,
                textColor: AppColors.kWhite,
                color: AppColors.kblue,
                onPressed: () async {
                  final cubit = context.read<MapsCubit>();
                  double distanceinKm =
                      (cubit.captinOriginDistanceTime!.distance!.value! / 1000)
                          .toDouble();
                  cubit.isAccepted = false;
                  cubit.completeRideRequest(
                      context: context, distanceinKm: distanceinKm);
                },
              ),
            ),
          ],
        ));
  }
}
