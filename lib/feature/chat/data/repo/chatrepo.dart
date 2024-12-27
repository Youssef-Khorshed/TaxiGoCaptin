

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_driver/feature/chat/data/model/message_data.dart';

import '../../../../Core/Utils/Network/Error/failure.dart';

abstract class Chatrepo {

  Future<Either<Failure, List<Message>>> getChatDetails({    required BuildContext context});
  Future<void> sendMessage({

   String? message,
    required Map data,
    required   String type,
    required BuildContext context
  });


}
