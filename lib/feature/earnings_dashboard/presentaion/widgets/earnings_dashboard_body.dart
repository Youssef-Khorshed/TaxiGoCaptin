import 'package:flutter/material.dart';

import 'ride_request_widget.dart';
import 'user_earning_details.dart';

class EarningsDashboardBody extends StatelessWidget {
  const EarningsDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .35,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserEarningDeails(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WalletData(title: "Overall earning", data: "\$ 0.00"),
                    WalletData(title: "Today Booking", data: "2"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25.0,
                  right: 20,
                  left: 20,
                ),
                child: Text(
                  "New Request ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => const RideRequestWidget(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: 3),
        )
      ],
    );
  }
}

class WalletData extends StatefulWidget {
  const WalletData({
    super.key,
    required this.title,
    required this.data,
  });
  final String title;
  final String data;
  @override
  State<WalletData> createState() => _WalletDataState();
}

class _WalletDataState extends State<WalletData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 100,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " ${widget.data}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
