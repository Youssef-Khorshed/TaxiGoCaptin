// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/Utils/assets/assets.dart';
import '../../../../core/Utils/colors/colors.dart';

//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// ignore: must_be_immutable
class SnappingSheetTitleAccepted extends StatelessWidget {
  String customerPhoneNumber;
  String cutomerName;
  SnappingSheetTitleAccepted({
    Key? key,
    required this.customerPhoneNumber,
    required this.cutomerName,
    required this.width,
  }) : super(key: key);

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
                  Text(
                    cutomerName,
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
                    onPressed: () {
                      _callPhoneNumber(customerPhoneNumber);
                    },
                    icon: SvgPicture.asset(
                      Assets.iconsCall,
                      height: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
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
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
