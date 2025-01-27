part of 'get_all_notification_cubit.dart';

@immutable
sealed class GetAllNotificationState {}

final class GetAllNotificationInitial extends GetAllNotificationState {}

final class GetAllNotificationLoading extends GetAllNotificationInitial {}

final class GetAllNotificationSuccess extends GetAllNotificationInitial {
  final NotificationModelData getAllNotificationModel;

  GetAllNotificationSuccess({required this.getAllNotificationModel});
}

final class GetAllNotificationError extends GetAllNotificationInitial {}
