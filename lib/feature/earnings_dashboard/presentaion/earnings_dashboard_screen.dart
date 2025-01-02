import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/Core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/History/Screens/my_history.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/Wallet/screens/wallet_screen.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/drawer_list.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/earnings_dashboard_body.dart';
import '../../../core/Utils/colors/colors.dart';

class EarningsDashboardScreen extends StatefulWidget {
  const EarningsDashboardScreen({super.key});

  @override
  State<EarningsDashboardScreen> createState() =>
      _EarningsDashboardScreenState();
}

class _EarningsDashboardScreenState extends State<EarningsDashboardScreen> {
  bool status = false;
  int selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onItemTap(int index) {
      setState(() {
        selctedIndex = index;
      });
      Navigator.pop(context);
    }

    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        final cubit = context.read<MapsCubit>();

        if (state is UpdateOriginLocatoin) {
          cubit.updateCaptinLoaction(
              context: context,
              location:
                  LatLng(cubit.orginPosition!.lat!, cubit.orginPosition!.lng!));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.home,
            style: AppStyles.text20Size500WightDarkGray,
          ),
          actions: [
            FlutterSwitch(
              width: 60.w,
              height: 30.h,
              value: status,
              borderRadius: 30.0,
              activeIcon: CircleAvatar(
                backgroundColor: AppColors.kblue,
              ),
              activeColor: AppColors.kblue,
              inactiveColor: AppColors.redColor,
              inactiveIcon: const CircleAvatar(
                backgroundColor: Colors.red,
              ),
              padding: 8.w,
              onToggle: (val) async {
                setState(() {
                  status = val;
                });

                if (val) {
                  final cubit = context.read<MapsCubit>();

                  await cubit.getCaptinPosition(title: 'captin');
                }
              },
            ),
            horizontalSpace(10.w),
          ],
        ),
        drawer: Drawer(
          child: DrawerList(
            onItemTap: (index) => onItemTap(index),
            selectedIndex: selctedIndex,
          ),
        ),
        body: EarningsDashboardBody(status: status),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
