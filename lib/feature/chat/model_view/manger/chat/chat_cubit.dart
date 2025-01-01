import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../Core/Utils/Network/Error/failure.dart';
import '../../../data/model/message_data.dart';
import '../../../data/repo/chatrepo.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final Chatrepo chatrepo;
  late Timer _timer; // التايمر لتحديث الرسائل
  List<Message> chats = [];
  ChatCubit(this.chatrepo) : super(ChatInitial());

  Future<void> sendMessage(String message, Map<String, dynamic> data,
      String type, BuildContext context) async {
    try {
      await chatrepo.sendMessage(
        data: data,
        type: type,
        context: context,
      );

      // Retrieve the current message list
      final currentMessages =
          (state is Chatsuccful) ? (state as Chatsuccful).messages : [];

      // Add the new message to the current list
      final newMessage = Message(
        createdAt: "",
        messageType: type,
        message: message,
        senderType: "user",
        lat: null,
        lng: null,
      );

      final updatedMessages = List<Message>.from(currentMessages)
        ..add(newMessage);

      // Save messages to cache
      await ChatCacheHelper.saveMessages(updatedMessages);

      emit(Chatsuccful(updatedMessages));
    } catch (e) {
      emit(Chaterror());
    }
  }

  void clearMessages() async {
    emit(ChatInitial());
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('messages');
  }

  Future<Either<Failure, List<Message>>> getChatdata(
      BuildContext context) async {
    if (state is! ChatLoad) {
      emit(ChatLoad());
    }

    // Try to load messages from cache first
    final cachedMessages = await ChatCacheHelper.loadMessages();
    if (cachedMessages.isNotEmpty) {
      emit(Chatsuccful(cachedMessages));
    }

    // Fetch new messages from API and compare with cached messages
    final response = await chatrepo.getChatDetails(context: context);
    response.fold(
      (failure) {
        emit(Chaterror());
      },
      (messages) {
        if (messages != cachedMessages) {
          chats = messages;
          // Only update if messages have changed
          emit(Chatupdate(messages));
          // Save the fetched messages to cache
          ChatCacheHelper.saveMessages(messages);
        }
      },
    );

    return response;
  }

  void startMessageUpdateTimer(BuildContext context) {
    // Start a timer to update messages every second
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      getChatdata(context);
    });
  }

  void stopMessageUpdateTimer() {
    _timer.cancel();
  }
}

class ChatCacheHelper {
  static Future<void> saveMessages(List<Message> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMessages =
        json.encode(messages.map((e) => e.toJson()).toList());
    prefs.setString('messages', encodedMessages);
  }

  static Future<List<Message>> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final messagesString = prefs.getString('messages');
    if (messagesString != null) {
      final List<dynamic> decodedMessages = json.decode(messagesString);
      return decodedMessages.map((e) => Message.fromJson(e)).toList();
    }
    return [];
  }
}
