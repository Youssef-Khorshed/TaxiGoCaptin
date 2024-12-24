import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';
import 'package:taxi_go_driver/core/Utils/localization/cubit/local_cubit.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorConnectionLost.dart';
import 'package:taxi_go_driver/feature/home/presentaion/widgets/home_screen_body.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/routes/routes.dart';
import '../../earnings_dashboard/presentaion/widgets/drawer_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LocalCubit>();
    return Scaffold(
      drawer: const Drawer(
        child: DrawerList(),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: SvgPicture.asset(
                Assets.iconsListIcon,
                colorFilter:
                    ColorFilter.mode(AppColors.kWhite, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.kDarkBlue,
        title: const Text(
          'Home',
          style: TextStyle(color: AppColors.kWhite),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, Routes.accountScreen);
              },
              child: CircleAvatar(
                backgroundImage: Image.asset(Assets.imagesDriverImage).image,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.kDarkBlue,
      body: cubit.state is InternetFailure
          ? CustomErrorconnectionlost()
          : const HomeScreenBody(),
    );
  }

  @override
  void dispose() {
    Constants.subscription?.cancel();
    super.dispose();
  }
}
