import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_dummy_widget.dart';
import 'package:taxi_go_driver/feature/History/controller/history_states.dart';
import 'package:taxi_go_driver/feature/History/controller/history_view_model.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/custom_details_filter_dropdown.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/custom_trip_card_history.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/loadign_state_view.dart';
import 'package:taxi_go_driver/feature/chat/model_view/chat_widgets/custom_empty_data_view.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/drawer_list.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int selctedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onItemTap(int index) {
      setState(() {
        selctedIndex = index;
      });
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: drawerAppBar(name: AppLocalizations.of(context)!.trips_history),
      drawer: Drawer(
        child: DrawerList(
          onItemTap: (index) => onItemTap(index),
          selectedIndex: selctedIndex,
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          verticalSpace(50.h),
          BlocBuilder<HistoryViewModel, HistoryStates>(
            bloc: HistoryViewModel.get(context)..getHistoryData(context),
            buildWhen: (previous, current) => current != previous,
            builder: (context, state) {
              if (state is HistorySuccessStates ||
                  state is AddToSaveToFavSuccessStates) {
                List<HistoryData> historyData =
                    HistoryViewModel.get(context).historyData;
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: historyData.isEmpty
                        ? Center(
                            child: CustomEmptyDataView(
                                message: AppLocalizations.of(context)!
                                    .empty_message),
                          )
                        : Column(
                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                      child: CustomDetailsfilterdropdown()),
                                ],
                              ),
                              verticalSpace(16.h),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: historyData.length,
                                  itemBuilder: (context, index) {
                                    return HistoryTripCard(
                                      onStarPressed: () {
                                        if (historyData[index].isFavorite ==
                                            true) {
                                          return;
                                        } else {
                                          HistoryViewModel.get(context)
                                              .addToFavTrip(
                                                  context,
                                                  historyData[index]
                                                      .ride![0]
                                                      .id!);
                                          HistoryViewModel.get(context)
                                              .getHistoryData(context);
                                        }
                                      },
                                      onSavedPressed: () {
                                        if (historyData[index].isSaved ==
                                            true) {
                                          return;
                                        } else {
                                          HistoryViewModel.get(context)
                                              .saveTrip(
                                                  context,
                                                  historyData[index]
                                                      .ride![0]
                                                      .id!);
                                          HistoryViewModel.get(context)
                                              .getHistoryData(context);
                                        }
                                      },
                                      historyData: historyData[index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              }
              if (state is HistoryFailureStates) {
                return CustomErroranimation(
                  errormessage: state.errMessage,
                  lottie: AppLottie.errorFailure,
                );
              }
              return LoadingStateView();
            },
          ),
        ],
      ),
    );
  }
}

AppBar drawerAppBar({required String name, String? image}) {
  return AppBar(
    backgroundColor: AppColors.whiteColor,
    title: Text(
      name,
      style: AppStyles.style16BlackW600,
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 25.r,
          backgroundColor: Colors.white,
          backgroundImage: image != null && image != ""
              ? NetworkImage(image)
              : const AssetImage(
                  AppImages.imagesProfileImage,
                ),
        ),
      ),
      horizontalSpace(10.w)
    ],
  );
  ;
}
