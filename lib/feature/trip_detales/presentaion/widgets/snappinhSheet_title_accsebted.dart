import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/Utils/assets/assets.dart';
import '../../../../core/Utils/colors/colors.dart';
//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class SnappingSheetTitleAccepted extends StatelessWidget {
  const SnappingSheetTitleAccepted({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 3),
          child: const Divider(
            height: 25,
            thickness: 7,
            color: AppColors.kgrey,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.all(10),
          width: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(Assets.imagesDriverImage),
                radius: 35,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mohamed",
                    style: TextStyle(
                        color: AppColors.kBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SvgPicture.asset(
                    Assets.iconsCar1,
                    height: 20,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.iconsCall,
                      height: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //   _callPhoneNumber('phoneNumber');
                    },
                    icon: SvgPicture.asset(
                      Assets.iconsMessage,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _callPhoneNumber(String phoneNumber) async {
    //   bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    //   if (res != null && res) {
    //     print("Call initiated");
    //   } else {
    //     print("Failed to make the call");
    //   }
    // }
  }
}
