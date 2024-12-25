import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/model/message_data.dart';
import '../../../data/repo/chatrepo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatrepo) : super(ChatInitial()) {
    _startPollingMessages();
  }

  final Chatrepo chatrepo;
  final List<Message> _messages = [];
  Timer? _pollingTimer;

  List<Message> get messages => List.unmodifiable(_messages);

  Future<void> sendMessage(
      String message, Map data, String type, BuildContext context) async {
    await chatrepo.sendMessage(
      data: data,
      type: type,
      context: context,
    );
    fetchMessages(context);
    _messages.clear();
    emit(Chatsuccful(_messages));

  }

  Future<void> fetchMessages(BuildContext context) async {
    emit(ChatLoad());

    final response = await chatrepo.getChatDetails(context: context);
    response.fold(
          (failure) {
        emit(Chaterror());
      },
          (newMessages) {
        _updateMessages(newMessages);
        emit(Chatsuccful(_messages));
      },
    );
  }

  void _updateMessages(List<Message> newMessages) {
    for (var message in newMessages) {
      if (!_messages.contains(message)) {
        _messages.add(message);
      }
    }
  }

  void _startPollingMessages() {
    _pollingTimer = Timer.periodic(const Duration(seconds: 3), (_) {
    });
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }
}
