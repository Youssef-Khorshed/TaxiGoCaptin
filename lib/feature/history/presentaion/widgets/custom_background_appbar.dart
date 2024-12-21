import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:taxi_go_driver/widgets/default_appbar.dart';

import '../../../../core/Utils/assets/images.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../../../earnings_dashboard/presentaion/widgets/drawer_list.dart';

class CustomBackgroundAppBar extends StatefulWidget {
  const CustomBackgroundAppBar({
    super.key,
    required this.widget,
    required this.appBarTitle,
    this.actions,
  });

  final Widget widget;
  final String appBarTitle;
  final List<Widget>? actions;

  @override
  State<CustomBackgroundAppBar> createState() => _CustomBackgroundAppBarState();
}

class _CustomBackgroundAppBarState extends State<CustomBackgroundAppBar> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        child: DrawerList(),
      ),
      backgroundColor: AppColors.kblue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.1,
              floating: false,
              backgroundColor: AppColors.kblue,
              flexibleSpace: FlexibleSpaceBar(
                background: DefaultAppbar(
                  actions: widget.actions,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                  ),
                  isDrawer: true,
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 10),
                    child: GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: SvgPicture.asset(AssetImagesconst.drawer)),
                  ),
                  title: widget.appBarTitle,
                  textColor: Colors.white,
                ),
              )),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.kDropMenu,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        )),
                    child: widget.widget),
              ],
            ),
          ),
        ],
        // child: ListView(
        //   children: [
        //     Stack(
        //       children: [
        //         Container(
        //           width: double.infinity,
        //           decoration: const ShapeDecoration(
        //               color: AppColors.kBackgroundColor,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.only(
        //                       topLeft: Radius.circular(30),
        //                       topRight: Radius.circular(30)))),
        //           child: Stack(
        //             clipBehavior: Clip.none,
        //             children: [widget.widget],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
