import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/home/Data/model/getride.dart';
import 'package:taxi_go_driver/feature/home/Data/repo.dart';

class HomeRepoImp implements HomeRepo {
  ApiService apiService;
  HomeRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<Getride>>> getdata(
      {required BuildContext context}) async {
    final res = await apiService.getRequest(
        'https://jsonplaceholder.typicode.com/posts',
        context: context);
    return res.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      List<dynamic> reslist = response.data;
      final result =
          reslist.map((toElement) => Getride.fromJson(toElement)).toList();
      return Right(result);
    });
  }
}
