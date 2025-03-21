import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/feature/chat/model_view/chat_widgets/custom_empty_data_view.dart';
import '../../../../core/Utils/Network/Services/services_locator.dart';
import '../../controller/cubit/get_all_notification_cubit.dart';
import 'notification_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllNotificationCubit>()
        ..getAllNotification(context: context),
      child: BlocBuilder<GetAllNotificationCubit, GetAllNotificationState>(
        builder: (context, state) {
          final getAllNotificationCubit =
              context.read<GetAllNotificationCubit>();
          if (state is GetAllNotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllNotificationSuccess) {
            var notificationData =
                getAllNotificationCubit.getAllNotificationModel!.data;
            return notificationData!.isEmpty
                ? CustomEmptyDataView(
                    message: AppLocalizations.of(context)!.empty_notification)
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return NotificationItemWidget(
                          index: getAllNotificationCubit
                              .getAllNotificationModel!.data![index]);
                    },
                    itemCount: getAllNotificationCubit
                        .getAllNotificationModel!.data!.length,
                  );
          }
          return const Center(child: AutoSizeText('No notification found'));
        },
      ),
    );
  }
}
