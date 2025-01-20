import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/models/captain_documents_model.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/repos/captain_documents_repo.dart';

class CaptainDocumentsRepoImpl extends CaptainDocumentsRepo {
  final ApiService apiService;

  CaptainDocumentsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, bool>> postCaptainDocuments(
      BuildContext context, CaptainDocumentsModel captainDocumentsModel) async {
    try {
      final response = await apiService.postRequest(
        Constants.captainDocumentsEndPoint,
        context: context,
        body: FormData.fromMap(captainDocumentsModel.toJson()),
      );
      return response.fold((l) => Left(ServerFailure(message: l)), (res) {
        if (res.data['success'] == true) {
          return const Right(true);
        } else {
          return const Right(false);
        }
      });
    } on NoInternetException {
      return Left(
        InternetConnectionFailure(message: 'No internet Connection'),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }
}
