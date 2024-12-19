part of 'nearby_ride_requests_cubit.dart';

sealed class NearbyRideRequestsState extends Equatable {
  const NearbyRideRequestsState();

  @override
  List<Object> get props => [];
}

final class NearbyRideRequestsInitial extends NearbyRideRequestsState {}

final class NearbyRideRequestsLoading extends NearbyRideRequestsState {}

final class NearbyRideRequestsSuccess extends NearbyRideRequestsState {
  final NearbyRideRequestsModel nearbyRideRequestsModel;
  NearbyRideRequestsSuccess(this.nearbyRideRequestsModel);
}

final class NearbyRideRequestsFailure extends NearbyRideRequestsState {
  final String message;
  NearbyRideRequestsFailure(this.message);
}
