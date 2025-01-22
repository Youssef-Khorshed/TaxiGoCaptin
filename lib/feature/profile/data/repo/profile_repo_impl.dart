import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/profile/data/profile_model.dart';
import 'package:taxi_go_driver/feature/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  ApiService apiService;
  ProfileRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, ProfielModel>> fetchUserInfo(
      BuildContext context) async {
    var response = await apiService.getRequest(Constants.profileEndPoint,
        context: context);
    return response.fold((ifLeft) => Left(ServerFailure(message: ifLeft)),
        (response) {
      ProfielModel profielModel = ProfielModel.fromJson(response.data);
      return Right(profielModel);
    });
  }
}
