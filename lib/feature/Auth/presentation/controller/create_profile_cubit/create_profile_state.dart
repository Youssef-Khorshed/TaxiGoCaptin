

part of 'create_profile_cubit.dart';

@immutable
sealed class CreateProfileState {}

final class CreateProfileInitial extends CreateProfileState {}
//get cities
final class GetCitiesSuccess extends CreateProfileState {
  GetCitiesModel? getCitiesModel;
  GetCitiesSuccess({this.getCitiesModel});
}
final class GetCitiesFailure extends CreateProfileState {
  String? error;
  GetCitiesFailure({this.error});
}
final class GetCitiesLoading extends CreateProfileState {}
//get districts
final class GetDistrictsSuccess extends CreateProfileState {
  GetDistrictsByCitiesModel? districts;
  GetDistrictsSuccess({this.districts});
}
final class GetDistrictsFailure extends CreateProfileState {
  String? error;
  GetDistrictsFailure({this.error});
}
final class GetDistrictsLoading extends CreateProfileState {}
//create profile
final class CreateProfileSuccess extends CreateProfileState {
  CreateProfileModel response;
  CreateProfileSuccess({required this.response});
}
final class CreateProfileFailure extends CreateProfileState {
  String? error;
  CreateProfileFailure({this.error});
}
final class CreateProfileLoading extends CreateProfileState {}
