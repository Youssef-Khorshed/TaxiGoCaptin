import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/fare_input_dialog.dart';

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
              FareInputDialog.showFareInputDialog(context);
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text("test")),
            ),
          ),
        ),
      ],
    ));
  }
}
