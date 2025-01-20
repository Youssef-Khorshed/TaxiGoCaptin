import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/chat/data/repo/chatrepo.dart';

import '../../../../Core/Utils/Network/Error/failure.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';
import '../model/message_data.dart';

class Chatrepoimp implements Chatrepo {
  final ApiService apiService;
  // final PusherConsumer _pusherConsumer;

  Chatrepoimp(
    this.apiService,
  );

  @override
  Future<Either<Failure, List<Message>>> getChatDetails({
    required BuildContext context,
  }) async {
    final response = await apiService.getRequest(
      Constants.rooms,
      context: context,
    );
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data['data'] is List) {
        final messages = (response.data['data'] as List)
            .map((json) => Message.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(messages);
      } else {
        return Left(ServerFailure(message: 'Invalid data format from server.'));
      }
    });
  }

  @override
  Future<void> sendMessage({
    String? message,
    required Map data,
    required String type,
    required BuildContext context,
  }) async {
    try {
      final response = await apiService.postRequest(
        Constants.sendchat,
        context: context,
        body: data,
      );
      if (kDebugMode) {
        print('Response: $response');
      }
    } catch (e) {
      log('Error sending message: $e');
    }
  }
}
