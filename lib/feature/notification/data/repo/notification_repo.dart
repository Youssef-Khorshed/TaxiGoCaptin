import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/notification/data/model/notification_model/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModelData>> getAllNotification({
    required BuildContext context,
  });
}
