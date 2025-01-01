import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';

import '../manger/chat/chat_cubit.dart';

class MessageInputBar extends StatefulWidget {
  final ChatCubit chatCubit;

  const MessageInputBar({super.key, required this.chatCubit});

  @override
  State<MessageInputBar> createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  late TextEditingController messageController;
  String messageText = ""; // لتخزين النص الحالي

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
    messageController.addListener(() {
      setState(() {
        messageText = messageController.text; // تحديث النص الحالي
      });
    });
  }

  @override
  void dispose() {
    messageController
        .dispose(); // تنظيف الـ Controller عند التخلص من الـ Widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
        ),
        child: SizedBox(
          height: 50.h,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.typeamessage,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.sp,
                      vertical: 10.sp,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30.h,
                width: 2.w,
                decoration: BoxDecoration(
                  color: AppColors.grayColor,
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              horizontalSpace(10.w),
              GestureDetector(
                child: Transform.rotate(
                  angle: isArabic ? 180 * 3.14159265359 / 180 : 0,
                  child: Image.asset(
                    AppIcons.send,
                    color: messageText.isNotEmpty
                        ? AppColors.blueColor
                        : AppColors.grayColor,
                  ),
                ),
                onTap: () {
                  final trimmedMessage = messageController.text.trim();
                  if (trimmedMessage.isNotEmpty) {
                    widget.chatCubit.sendMessage(
                      trimmedMessage,
                      {"message_type": "text", "message": trimmedMessage},
                      "text",
                      context,
                    );
                    messageController.clear();
                  }
                },
              ),
              horizontalSpace(10.w),
            ],
          ),
        ),
      ),
    );
  }
}
