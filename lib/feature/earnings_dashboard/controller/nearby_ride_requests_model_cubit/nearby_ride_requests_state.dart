part of 'nearby_ride_requests_cubit.dart';

sealed class NearbyRideRequestsState {
  const NearbyRideRequestsState();
}

final class NearbyRideRequestsInitial extends NearbyRideRequestsState {}

final class NearbyRideRequestsLoading extends NearbyRideRequestsState {}

final class NearbyRideRequestsStramClose extends NearbyRideRequestsState {}

final class NearbyRideRequestsSuccess extends NearbyRideRequestsState {
  final NearbyRideRequestsModel nearbyRideRequestsModel;
  NearbyRideRequestsSuccess(this.nearbyRideRequestsModel);
}

final class NearbyRideRequestsFailure extends NearbyRideRequestsState {
  final String message;
  NearbyRideRequestsFailure(this.message);
}

class ChangeCheck extends NearbyRideRequestsState {
  bool check;
  ChangeCheck({required this.check});
}
