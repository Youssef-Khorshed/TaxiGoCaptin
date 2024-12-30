part of 'create_profile_cubit.dart';

@immutable
sealed class CreateProfileState {}

final class CreateProfileInitial extends CreateProfileState {}

//get cities
class GetCitiesSuccess extends CreateProfileState {
  final GetCitiesModel? getCitiesModel;
  GetCitiesSuccess({this.getCitiesModel});
}

class GetCitiesFailure extends CreateProfileState {
  final String? error;
  GetCitiesFailure({this.error});
}

final class GetCitiesLoading extends CreateProfileState {}

//get districts
class GetDistrictsSuccess extends CreateProfileState {
  final GetDistrictsModel? districts;
  GetDistrictsSuccess({this.districts});
}

class GetDistrictsFailure extends CreateProfileState {
  final String? error;
  GetDistrictsFailure({this.error});
}

final class GetDistrictsLoading extends CreateProfileState {}

//create profile
class CreateProfileSuccess extends CreateProfileState {
  final CreateProfileModel response;
  CreateProfileSuccess({required this.response});
}

class CreateProfileFailure extends CreateProfileState {
  final String? error;
  CreateProfileFailure({this.error});
}

final class CreateProfileLoading extends CreateProfileState {}
