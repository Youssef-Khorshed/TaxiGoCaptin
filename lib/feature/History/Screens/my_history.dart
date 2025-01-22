import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_dummy_widget.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/drawer_app_bar.dart';
import 'package:taxi_go_driver/feature/History/controller/history_states.dart';
import 'package:taxi_go_driver/feature/History/controller/history_view_model.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/custom_details_filter_dropdown.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/custom_trip_card_history.dart';
import 'package:taxi_go_driver/feature/chat/model_view/chat_widgets/custom_empty_data_view.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/drawer_list.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<HistoryData> historyData = [];

  final ScrollController _scrollController = ScrollController();

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: FutureBuilder<AppBar>(
          future: drawerAppBar(
            name: AppLocalizations.of(context)!.trips_history,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AppBar(
                backgroundColor: AppColors.whiteColor,
                title: Text(
                  AppLocalizations.of(context)!.wallet,
                  style: AppStyles.style16BlackW600,
                ),
                centerTitle: true,
              );
            } else if (snapshot.hasError) {
              return AppBar(
                backgroundColor: AppColors.whiteColor,
                title: Text(
                  AppLocalizations.of(context)!.wallet,
                  style: AppStyles.style16BlackW600,
                ),
                centerTitle: true,
              );
            } else {
              return snapshot.data!;
            }
          },
        ),
      ),
      drawer: Drawer(
        child: DrawerList(
          onItemTap: (index) => onItemTap(index),
          selectedIndex: selctedIndex,
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: BlocProvider(
        create: (context) => getIt.get<HistoryViewModel>()
          ..getHistoryData(context, tripHistory: "day"),
        child: BlocBuilder<HistoryViewModel, HistoryStates>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is HistorySuccessStates) {
              historyData.clear();
              historyData.addAll(HistoryViewModel.get(context).historyData);
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: CustomDetailsfilterdropdown()),
                        ],
                      ),
                      historyData.isEmpty
                          ? verticalSpace(
                              MediaQuery.of(context).size.height / 5)
                          : verticalSpace(16.h),
                      historyData.isEmpty
                          ? CustomEmptyDataView(
                              message:
                                  AppLocalizations.of(context)!.empty_message)
                          : Expanded(
                              child: ListView.builder(
                                controller: _scrollController,
                                itemCount: historyData.length,
                                itemBuilder: (context, index) {
                                  return HistoryTripCard(
                                    historyData: historyData[index],
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              );
            } else if (state is HistoryFailureStates) {
              return CustomErroranimation(
                errormessage: state.errMessage,
                lottie: AppLottie.errorFailure,
              );
            }

            return state is HistoryLoadingStates
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Skeletonizer(
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                      child: CustomDetailsfilterdropdown()),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: 10,
                                    itemBuilder: (context, index) =>
                                        const CustomDummyWidget()),
                              ),
                            ],
                          ),
                        )))
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: CustomDetailsfilterdropdown()),
                            ],
                          ),
                          historyData.isEmpty
                              ? verticalSpace(
                                  MediaQuery.of(context).size.height / 5)
                              : verticalSpace(16.h),
                          historyData.isEmpty
                              ? CustomEmptyDataView(
                                  message: AppLocalizations.of(context)!
                                      .empty_message)
                              : Expanded(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: historyData.length,
                                    itemBuilder: (context, index) {
                                      return HistoryTripCard(
                                        historyData: historyData[index],
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
