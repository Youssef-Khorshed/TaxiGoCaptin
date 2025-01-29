import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/chat/model_view/chat_widgets/custom_message_input_bar_chat.dart';
import 'package:taxi_go_driver/feature/chat/model_view/chat_widgets/custom_user_message_chat.dart';
import 'package:taxi_go_driver/feature/chat/model_view/chat_widgets/user_name_container.dart';
import 'package:taxi_go_driver/feature/chat/data/model/message_data.dart';
import 'package:taxi_go_driver/feature/chat/model_view/chat_widgets/custom_empty_data_view.dart';
import 'package:taxi_go_driver/feature/chat/model_view/manger/chat/chat_cubit.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  String username;
  ChatScreen({super.key, required this.username});

  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final chatCubit = getIt<ChatCubit>();

    chatCubit.getChatdata(context);
    chatCubit.startMessageUpdateTimer(
        context); // Start the timer to update messages every second

    return BlocProvider.value(
      value: chatCubit,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            verticalSpace(40.h),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: UserNameContainer(
                name: username,
              ),
            ),
            BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is Chatupdate) {
                  // Scroll to bottom when messages are updated
                  _scrollToBottom();
                }
              },
              buildWhen: (previous, current) => current is Chatupdate,
              builder: (context, state) {
                if (state is ChatLoad) {
                  return const Expanded(
                      child: CustomEmptyDataView(message: "No messages yet"));
                }

                if (state is Chaterror) {
                  return const Center(child: Text("Error"));
                }

                List<Message> messages =
                    BlocProvider.of<ChatCubit>(context).chats;
                return Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(15.sp),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      return UserMessage(
                        time: message.createdAt,
                        message: message.message,
                        userType: message.senderType,
                        widthFactor: screenWidth * 0.9,
                      );
                    },
                  ),
                );
              },
            ),
            MessageInputBar(chatCubit: chatCubit),
          ],
        ),
      ),
    );
  }
}
