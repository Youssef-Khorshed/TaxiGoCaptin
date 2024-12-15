import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/requset_dialog_body.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/snappingSheet_title_request.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/snappinhSheet_title_accsebted.dart';
import '../../../../core/Utils/assets/assets.dart';
import '../../../../core/Utils/colors/colors.dart';

class CustomSnappingSheet extends StatefulWidget {
  const CustomSnappingSheet({super.key, required this.isAccepted});
  final bool isAccepted;
  @override
  _CustomSnappingSheetState createState() => _CustomSnappingSheetState();
}

class _CustomSnappingSheetState extends State<CustomSnappingSheet> {
  // final SnappingSheetController _controller = SnappingSheetController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<SnappingSheetCubit, SnappingSheetState>(
      builder: (context, state) {
        var cubit = context.read<SnappingSheetCubit>();
        return SnappingSheet(
          // controller: _controller,
          lockOverflowDrag: false,
          snappingPositions: const [
            SnappingPosition.pixels(
              positionPixels: 400,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 1750),
            ),
            SnappingPosition.factor(
              positionFactor: 0.0,
              snappingCurve: Curves.easeOutExpo,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.top,
            ),
            SnappingPosition.factor(
              positionFactor: 0.65,
              snappingCurve: Curves.bounceOut,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.bottom,
            ),
          ], // Your main screen content goes here
          grabbingHeight: cubit.isAccepted ? 120 : 90,
          // Start fully closed
          grabbing: Container(
            color: AppColors.kBackgroundColor,
            child: Visibility(
              replacement: SnappingSheetTitleRequest(width: width),
              visible: cubit.isAccepted,
              child: SnappingSheetTitleAccepted(
                width: width,
              ),
            ),
          ),
          sheetBelow: SnappingSheetContent(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: AppColors.kBackgroundColor,
              child: RequestDialogBody(
                width: width,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.imagesMap),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
