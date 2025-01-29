// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/methodHelpers.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class BookingDetailsAccepted extends StatefulWidget {
  BookingDetailsAccepted({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingDetailsAccepted> createState() => _BookingDetailsAcceptedState();
}

class _BookingDetailsAcceptedState extends State<BookingDetailsAccepted> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapsCubit>();
    return cubit.distanceTime == null
        ? SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Column(
                //       children: [
                //         Text(
                //           "Distance",
                //           style:
                //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //         ),
                //         Text(
                //           context
                //               .read<MapsCubit>()
                //               .distanceTime!
                //               .distance!
                //               .text!
                //               .toString(),
                //           style: TextStyle(fontSize: 25),
                //         ),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         Text(
                //           "Time",
                //           style:
                //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //         ),
                //         Text(
                //           context
                //               .read<MapsCubit>()
                //               .distanceTime!
                //               .duration!
                //               .text!
                //               .toString(),
                //           style: TextStyle(fontSize: 25),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),

                Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blueColor),
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: AppColors.blueColor,
                      ),
                      horizontalSpace(10.w),
                      Text(convertToTimeString(
                          context
                              .read<MapsCubit>()
                              .distanceTime!
                              .duration!
                              .text!,
                          AppLocalizations.of(context)!.hours,
                          AppLocalizations.of(context)!.mins)),
                      horizontalSpace(20.w),
                      Container(
                        width: 2,
                        color: AppColors.blueColor.withAlpha(100),
                        height: 50.h,
                      ),
                    ],
                  ),
                  horizontalSpace(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.userLocationImage,
                        width: 20.w,
                        height: 20.h,
                      ),
                      horizontalSpace(10),
                      Text(
                        convertMetersToKilometers(
                            context
                                .read<MapsCubit>()
                                .distanceTime!
                                .distance!
                                .value!
                                .toDouble(),
                            AppLocalizations.of(context)!.km,
                            AppLocalizations.of(context)!.meter),

                        // convertMilesToKilometerString(
                        //   context
                        //   .read<MapsCubit>()
                        //   .distanceTime
                        //   .distance!
                        //   .value!
                        //   .toDouble()
                        //   )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
