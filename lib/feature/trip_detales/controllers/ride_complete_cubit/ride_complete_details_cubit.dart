import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete.dart';

part 'ride_complete_details_state.dart';

class RideCompleteDetailsCubit extends Cubit<RideCompleteDetailsState> {
  final RideCompleteRepo rideCompleteRepoImp;

  RideCompleteDetailsCubit(this.rideCompleteRepoImp)
      : super(RideCompleteDetailsInitial());

  Future<void> getRideCompleteDetails(BuildContext context) async {
    emit(RideCompleteDetailsLoading());

    // استدعاء الريبو للحصول على التفاصيل
    final result = await rideCompleteRepoImp.getRideCompleteDetails(context);

    // التعامل مع النتيجة
    result.fold(
      (failure) {
        // في حال حدوث فشل
        emit(RideCompleteDetailsFailure(failure.message));
      },
      (rideCompleteDetails) {
        // في حال نجاح الاستجابة
        emit(RideCompleteDetailsSuccess(rideCompleteDetails));
      },
    );
  }
}
