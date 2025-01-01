part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

class Chatsend extends ChatState {}

class ChatLoad extends ChatState {}

class Chatsuccful extends ChatState {
  final List<Message> messages;

  Chatsuccful(this.messages);
}

class Chatupdate extends ChatState {
  final List<Message> messages;

  Chatupdate(this.messages);
}

class Chaterror extends ChatState {}

class Listenchat extends ChatState {}
