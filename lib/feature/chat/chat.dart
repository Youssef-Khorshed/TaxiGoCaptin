import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/Utils/Network/Services/services_locator.dart';
import '../../core/Utils/colors/colors.dart';
import 'model_view/chat_widgets/custom_message_input_bar_chat.dart';
import 'model_view/chat_widgets/custom_user_message_chat.dart';
import 'model_view/chat_widgets/locationmessage.dart';
import 'model_view/chat_widgets/user_name_container.dart';
import 'model_view/manger/chat/chat_cubit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatCubit _chatCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _chatCubit = getIt<ChatCubit>();
    _chatCubit.fetchMessages(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _chatCubit,
      child: Scaffold(
        backgroundColor: AppColors.kWhite,

        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const UserNameContainer(),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoad) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is Chaterror) {
              return const Center(child: Text("Error"));
            }
            if (state is Chatsuccful) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.all(5.sp),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        if (message.messageType == "location") {
                          return LocationMessage(
                            latitude: 25.276987,
                            longitude: 55.296249,
                            widthFactor: screenWidth * 0.7,
                            heightFactor: screenHeight * 0.2,
                            usertype: message.senderType,
                            message: message.message ?? "",
                          );
                        }
                        return UserMessage(
                          message: message.message ?? "",
                          userType: message.senderType,
                          widthFactor: screenWidth * 0.9,
                        );

                      },
                    ),
                  ),
                  MessageInputBar(chatCubit: _chatCubit),
                ],
              );
            }

            return const Center(child: Text('Start a conversation'));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _chatCubit.close();
    _scrollController.dispose();
    super.dispose();
  }
}
