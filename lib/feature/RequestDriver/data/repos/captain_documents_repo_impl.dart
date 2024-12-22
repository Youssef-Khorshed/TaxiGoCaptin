import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, CaptainDocumentsModel>> postCaptainDocuments(
      BuildContext context, CaptainDocumentsModel captainDocumentsModel) async {
    try {
      var response = await apiService.postRequest(
          Constants.captainDocumentsEndPoint,
          context: context,
          body: captainDocumentsModel.toJson());
      return Right(response);
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }
}
