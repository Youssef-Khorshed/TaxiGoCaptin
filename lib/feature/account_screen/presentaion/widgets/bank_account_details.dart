import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';

class BankAccountDetails extends StatelessWidget {
  const BankAccountDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircleAvatar(
              radius: 40,
              child: SvgPicture.asset(
                Assets.iconsBankIcon,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 200,
                  child: Text(
                    'STATE BANK OF iq     ...1234',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Primary account',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
