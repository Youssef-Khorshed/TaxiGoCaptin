import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/ride_complete_cubit/ride_complete_details_cubit.dart';

class TestSccreen extends StatelessWidget {
  const TestSccreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.walletRoute);
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text("paid")),
            ),
          ),
        ),
        BlocBuilder<RideCompleteDetailsCubit, RideCompleteDetailsState>(
          builder: (context, state) {
            return Center(
              child: GestureDetector(
                onTap: () async {
                  Navigator.pushReplacementNamed(
                      context, Routes.paymentDetailsRoute);
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("payment")),
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}
