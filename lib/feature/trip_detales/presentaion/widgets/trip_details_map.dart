import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class TripDetailsMap extends StatelessWidget {
  const TripDetailsMap({
    super.key,
    required this.location,
    required this.address,
    required this.icon,
  });
  final String location;
  final String address;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          location,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          address,
          style: AppStyles.text16Size400darkGrey,
        ),
        leading: SvgPicture.asset(
          icon,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
