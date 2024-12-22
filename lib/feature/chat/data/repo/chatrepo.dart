

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Features/Chat/data/model/message_data.dart';

import '../../../../Core/Utils/Network/Error/failure.dart';
import '../../../../Core/Utils/pusher_configuration/dynamic_listener.dart';

abstract class Chatrepo {

  Future<Either<Failure, List<Message>>> getChatDetails({    required BuildContext context});
  Future<void> sendMessage({

   String? message,
    required Map data,
    required   String type,
    required BuildContext context
  });


}
