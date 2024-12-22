import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo_impl.dart';

part 'nearby_ride_requests_state.dart';

class NearbyRideRequestsCubit extends Cubit<NearbyRideRequestsState> {
  NearbyRideRequestsCubit(this.nearbyRideRequestsRepoImpl)
      : super(NearbyRideRequestsInitial());
  final NearbyRideRequestsRepoImpl nearbyRideRequestsRepoImpl;

  Future<void> getNearbyRideRequests(context) async {
    emit(NearbyRideRequestsLoading());
    final result =
        await nearbyRideRequestsRepoImpl.fetchNearbyRideRequests(context);
    result.fold((failure) {
      emit(NearbyRideRequestsFailure(failure.message));
    }, (rideCompleteDetails) {
      emit(NearbyRideRequestsSuccess(rideCompleteDetails));
    });
  }
}
