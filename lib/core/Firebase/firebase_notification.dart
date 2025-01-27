import 'dart:async';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Services/internetconnection.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_driver/main.dart';

class FirebaseNotification {
  static ApiService apiServices =
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>());
  static FirebaseMessaging fcm = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future<void> initNotifications() async {
    AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              enableVibration: true,
              importance: NotificationImportance.High,
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white)
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) {
        return NotificationController.onActionReceivedMethod(receivedAction);
      },
      onNotificationCreatedMethod: (ReceivedNotification receivedNotification) {
        return NotificationController.onNotificationCreatedMethod(
            receivedNotification);
      },
      onNotificationDisplayedMethod:
          (ReceivedNotification receivedNotification) {
        return NotificationController.onNotificationDisplayedMethod(
            receivedNotification);
      },
      onDismissActionReceivedMethod: (ReceivedAction receivedAction) {
        return NotificationController.onDismissActionReceivedMethod(
            receivedAction);
      },
    );
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  static Future<void> removeToken(BuildContext context) async {
    await sendToken(firebaseToken: '', context: context);
    if (kDebugMode) {
      print("removed");
    }
  }

  static Future<void> init(BuildContext context) async {
    await fcm.requestPermission();
    String? token = await fcm.getToken();
    if (kDebugMode) {
      log(token ?? 'No token found');
    }
    if (token != null) {
      await sendToken(
        context: context,
        firebaseToken: token,
      );
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) {
        log('test notification');
      }
      try {
        UserNotification userData = UserNotification.fromJson(message.data);
        var title = userData.title;
        var body = userData.body;
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: UniqueKey().hashCode,
            channelKey: "basic_channel",
            title: title,
            body: body,
            payload: {},
            roundedLargeIcon: true,
            notificationLayout: NotificationLayout.Messaging,
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessages);
  }

  @pragma('vm:entry-point')
  static Future<void> handleBackGroundMessages(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    if (kDebugMode) {
      print('test background notification');
    }
    try {
      UserNotification userData = UserNotification.fromJson(message.data);
      var title = userData.title;
      var body = userData.body;
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: UniqueKey().hashCode,
          channelKey: "basic_channel",
          title: title,
          body: body,
          payload: {},
          roundedLargeIcon: true,
          notificationLayout: NotificationLayout.Messaging,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<void> sendToken({
    required String? firebaseToken,
    required BuildContext context,
  }) async {
    try {
      String sendTokenUrl =
          "${Constants.baseUrl}/notifications?fcm_token=${firebaseToken ?? ''}";

      await apiServices.getRequest(
        sendTokenUrl,
        context: context,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}

class UserNotification {
  final String? title;
  final String? body;

  UserNotification({required this.title, required this.body});

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
      title: json['title'] != null ? json['title'] : null,
      body: json['body'] != null ? json['body'] : null,
    );
  }
}

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {}
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {}
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notification-page',
        (route) =>
            (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
  }
}
