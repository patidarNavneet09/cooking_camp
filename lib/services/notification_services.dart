import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static final Set<String> _receivedNotificationIds = {}; // Track processed notifications

  Future<void> initialize() async {
    const InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        handleResponse(response);
      },
    );

    FirebaseMessaging.onMessage.listen((message) {
      _handleIncomingMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleIncomingMessage(message);
    });
  }

  void _handleIncomingMessage(RemoteMessage message) async {
    // Check for duplicate using notification ID
    String? notificationId = message.data['n_id'];
    if (notificationId != null && _receivedNotificationIds.contains(notificationId)) {
      debugPrint('Duplicate notification ignored: $notificationId');
      return; // Ignore duplicate notifications
    }

    // Mark this notification as processed
    if (notificationId != null) {
      _receivedNotificationIds.add(notificationId);
    }

    // Display the notification
    if(Platform.isAndroid) {
      displayNotification(message);
    }
  }

  Future<void> displayNotification(RemoteMessage message) async {
    try {
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "high_importance_channel",
          "High Importance Notifications",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound('notification'), // Use a custom sound
        ),
        iOS: DarwinNotificationDetails(sound: 'notification.caf'),
      );

      await _flutterLocalNotificationsPlugin.show(
        message.hashCode, // Unique ID for each notification
        message.notification?.title ?? 'N/A',
        message.notification?.body ?? 'N/A',
        notificationDetails,
        payload: message.data.toString(),
      );
    } catch (e) {
      debugPrint('Error displaying notification: $e');
    }
  }

  Future<void> handleResponse(NotificationResponse response) async {
    // Process the notification response (e.g., navigate to a screen)
    debugPrint('Notification clicked: ${response.payload}');
  }
}




// import 'dart:convert';
// import 'dart:math';
// import 'package:cooking_champs/utils/utility.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
// @pragma('vm:entry-point')
// Future<void> _backgroundHandler(NotificationResponse message) async {
//   debugPrint('Background Notification: ${message.payload}');
//   NotificationService.handleResponse(message, "set", "navigate");
// }
//
// class NotificationService {
//   static final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static const String _channelId = "high_importance_channel";
//   static const String _channelName = "High Importance Notifications";
//
//   /// Initialize notification settings
//   Future<void> initialize() async {
//     const initializationSettings = InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//
//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: _backgroundHandler,
//       onDidReceiveNotificationResponse: (message) => handleResponse(message, "set", "navigate"),
//     );
//
//     Utility.getFcm();
//
//     final androidPlugin = _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//     await androidPlugin?.requestNotificationsPermission();
//     await androidPlugin?.createNotificationChannel(const AndroidNotificationChannel(
//       _channelId,
//       _channelName,
//       importance: Importance.max,
//     ));
//
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.onMessage.listen(displayNotification);
//     FirebaseMessaging.instance.getInitialMessage().then(handleInitialMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   }
//
//   /// Display notification
//   static Future<void> displayNotification(RemoteMessage message) async {
//     try {
//       final notificationDetails = const NotificationDetails(
//         android: AndroidNotificationDetails(
//           _channelId,
//           _channelName,
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//         iOS: DarwinNotificationDetails(
//           presentAlert: true,
//           presentSound: true,
//         ),
//       );
//
//       await _flutterLocalNotificationsPlugin.show(
//         Random().nextInt(1000),
//         message.notification?.title ?? 'No Title',
//         message.notification?.body ?? 'No Body',
//         notificationDetails,
//         payload: json.encode(message.data),
//       );
//     } catch (e) {
//       debugPrint('Notification Display Error: $e');
//     }
//   }
//
//   /// Handle notification response
//   static Future<void> handleResponse(NotificationResponse response, String pre, String navigate) async {
//     try {
//       final payload = response.payload ?? '';
//       final data = jsonDecode(payload) as Map<String, dynamic>;
//       navigateToScreen(data, data['n_id']?.toString() ?? '');
//     } catch (e) {
//       debugPrint('Response Handling Error: $e');
//     }
//   }
//
//   /// Handle message for navigation
//   static Future<void> handleMessage(RemoteMessage message) async {
//     try {
//       final data = message.data;
//       navigateToScreen(data, data['n_id'] ?? '');
//     } catch (e) {
//       debugPrint('Message Handling Error: $e');
//     }
//   }
//
//   /// Navigate based on notification type
//   static Future<void> navigateToScreen(Map<String, dynamic> data, String id) async {
//     final clickType = data['click_type']?.toString() ?? '';
//
//     try {
//       Widget screen;
//       // switch (clickType) {
//       //   case "booking_cancelled_owner":
//       //     screen = PastReservationScreen(
//       //       model: null,
//       //       bookingId: id,
//       //       type: 'notification',
//       //       onUpdate: () {},
//       //     );
//       //     break;
//       //   case "booking":
//       //   case "booking_cancelled_user":
//       //     screen = CalenderView(type: 'Notification', id: id);
//       //     break;
//       //   case "chat":
//       //     _saveChatData(data);
//       //     screen = DashBoardScreen(tabIndex: 2);
//       //     break;
//       //   default:
//       //     screen = DashBoardScreen();
//       // }
//      // navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => screen));
//     } catch (e) {
//       debugPrint('Navigation Error: $e');
//     }
//   }
//
//   /// Save chat-related data
//   static void _saveChatData(Map<String, dynamic> data) {
//   //   PreferencesServices.savingData("n_id", data['n_id'].toString());
//   //   LocalStorageServices.savingData("n_type", "Notification");
//   //   LocalStorageServices.savingData("r_name", data['name'].toString());
//   //   LocalStorageServices.savingData("n_image", ApiPath.imgBaseUrl + (data['image']?.toString() ?? ''));
//    }
//
//   /// Handle initial message when app is terminated
//   static void handleInitialMessage(RemoteMessage? message) {
//     if (message != null) {
//       handleMessage(message);
//     }
//   }
// }
