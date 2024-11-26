import 'package:cooking_champs/main.dart';
import 'package:cooking_champs/model/dynamic_models/notification_model.dart';
import 'package:cooking_champs/views/friend_request.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';
import 'dart:math';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const String _channelId = "high_importance_channel";
  static const String _channelName = "High Importance Notifications";

  /// Initialize notification settings
  Future<void> initialize() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: _backgroundHandler,
      onDidReceiveNotificationResponse: (response) {
        handleResponse(response, "set", "navigate");
      },

    );

    // Request notification permissions for Android
    final androidPlugin = _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.requestNotificationsPermission();
    await androidPlugin?.createNotificationChannel(const AndroidNotificationChannel(
      _channelId,
      _channelName,
      importance: Importance.max,
    ));

    // Configure foreground notification display for iOS
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Listen for messages in various app states
    FirebaseMessaging.instance.getInitialMessage().then(handleInitialMessage);
    FirebaseMessaging.onMessage.listen(displayNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

  }


  /// Display notification
  static Future<void> displayNotification(RemoteMessage message) async {
    try {
      final notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound('notification'), // Custom sound
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
         // sound: 'notification.caf', // Custom sound for iOS
        ),
      );

      await _flutterLocalNotificationsPlugin.show(
        Random().nextInt(1000), // Unique ID
        message.notification?.title ?? 'No Title',
        message.notification?.body ?? 'No Body',
        notificationDetails,
        payload: jsonEncode(message.data),
      );
       // handleMessage(message);
    } catch (e) {
      debugPrint('Notification Display Error: $e');
    }
  }

  /// Handle notification response
  static Future<void> handleResponse(NotificationResponse response, String pre, String navigate) async {
    try {
      final payload = response.payload ?? '';
      debugPrint("Payload: $payload");

      final data = jsonDecode(payload) as Map<String, dynamic>;
      NotificationModel model = NotificationModel.fromJson(data);
      navigateToScreen(model);
    } catch (e) {
      debugPrint('Response Handling Error: $e');
    }
  }

  /// Handle background notification
  @pragma('vm:entry-point')
  static Future<void> _backgroundHandler(NotificationResponse response) async {
    debugPrint('Background Notification: ${response.payload}');
    handleResponse(response, "set", "navigate");
  }

  /// Handle message for navigation
  static Future<void> handleMessage(RemoteMessage message) async {
    try {
      final data = message.data;
      debugPrint("Message Data: $data");

      NotificationModel model = NotificationModel.fromJson(data);
      navigateToScreen(model);
    } catch (e) {
      debugPrint('Message Handling Error: $e');
    }
  }

  /// Navigate based on notification type
  static Future<void> navigateToScreen(NotificationModel model) async {
    debugPrint("Notification Model: ${model.body}");

    String clickType = model.body?.toString() ?? '';
    try {
      if (clickType == "Friend Request Accepted!") {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => FriendRequestView(type: 'Notification')),
              (_) => false,
        );
      } else {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => FriendRequestView(type: 'Notification')),
              (_) => false,
        );
      }
    } catch (e) {
      debugPrint('Navigation Error: $e');
    }
  }

  /// Handle initial message when the app is terminated
  static void handleInitialMessage(RemoteMessage? message) {
    if (message != null) {
      debugPrint("Initial Message: ${message.data}");
      handleMessage(message);
    }
  }
}



// @pragma('vm:entry-point')
// Future<void> _backgroundHandler(NotificationResponse message) async {
//   debugPrint('Background Notification: ${message.payload}');
//   //NotificationService.handleResponse(message, "set", "navigate");
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
//      onDidReceiveNotificationResponse: (message) => handleResponse(message, "set", "navigate"),
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
//         payload: message.data.toString(),
//         //json.encode(message.data),
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
//       debugPrint("payload...$payload");
//       final data = jsonDecode(payload) as Map<String, dynamic>;
//       debugPrint("data22...$data");
//       NotificationModel model = NotificationModel.fromJson(data);
//       navigateToScreen(data,model);
//     } catch (e) {
//       debugPrint('Response Handling Error: $e');
//     }
//   }
//
//   /// Handle message for navigation
//   static Future<void> handleMessage(RemoteMessage message) async {
//     try {
//       final data = message.data;
//       debugPrint("data...$data");
//       NotificationModel model = NotificationModel.fromJson(data);
//       navigateToScreen(data,model);
//     } catch (e) {
//       debugPrint('Message Handling Error: $e');
//     }
//   }
//
//   /// Navigate based on notification type
//   static Future<void> navigateToScreen(Map<String, dynamic> data, NotificationModel model) async {
//     debugPrint("model.....${model.body}");
//     String  clickType = model.body.toString();
//         //data['click_type']?.toString() ?? '';
//
//     try {
//       // Widget screen;
//       // switch (clickType) {
//       //   case "Cooking":
//       //     screen = DashBoardView(
//       //      pageIndex: 1,
//       //     );
//       //     break;
//       //   default:
//       //     screen = DashBoardView(pageIndex: 2,);
//       clickType != "Friend Request Accepted!"?
//           navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => FriendRequestView(type: 'Notification',)),(_) => false):null;
//      //}
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
//       debugPrint("message.........${message}");
//   //    handleMessage(message);
//     }
//   }
// }
