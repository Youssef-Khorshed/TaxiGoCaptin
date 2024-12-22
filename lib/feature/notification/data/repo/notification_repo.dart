import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import '../model/get_all_notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, GetAllNotificationModel>> getAllNotification({
    required BuildContext context,
  });
}
