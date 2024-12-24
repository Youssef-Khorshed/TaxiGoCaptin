import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingDetailsAccepted extends StatelessWidget {
  const BookingDetailsAccepted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.distance,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "1.4 km",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.time,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "6 Min",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
