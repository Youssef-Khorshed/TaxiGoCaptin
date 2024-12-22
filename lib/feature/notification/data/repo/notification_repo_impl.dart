// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/notification/data/model/get_all_notification_model.dart';
import '../../../../core/Utils/Network/Error/exception.dart';
import 'notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  ApiService apiService;

  NotificationRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, GetAllNotificationModel>> getAllNotification(
      {required BuildContext context}) async {
    try {
      final response = await apiService.getRequest(
        context: context,
        Constants.getAllNotificationURL(),
      );
      return Right(GetAllNotificationModel.fromJson(response));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }
}
