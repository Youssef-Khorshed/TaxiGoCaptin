// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';

// ignore: must_be_immutable
class BookingDetailsAccepted extends StatefulWidget {
  BookingDetailsAccepted({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingDetailsAccepted> createState() => _BookingDetailsAcceptedState();
}

class _BookingDetailsAcceptedState extends State<BookingDetailsAccepted> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is LegsLoaded) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Distance",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      context
                          .read<MapsCubit>()
                          .distanceTime!
                          .distance!
                          .text!
                          .toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Time",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      context
                          .read<MapsCubit>()
                          .distanceTime!
                          .duration!
                          .text!
                          .toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
