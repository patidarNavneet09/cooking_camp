import 'dart:io';
import 'package:cooking_champs/main.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/model/dynamic_models/notification_model.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/friend_request.dart';
import 'package:cooking_champs/views/story/storie_detials.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:convert' as convert;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
 static InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(),
  );

  static const String _channelId = "high_importance_channel";
  static const String _channelName = "High Importance Notifications";

  /// Initialize notification settings
  Future<void> initialize() async {


    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
       onDidReceiveBackgroundNotificationResponse: _backgroundHandler,
      onDidReceiveNotificationResponse: (response) {
        debugPrint("response.....${response.payload}");
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


    if(Platform.isAndroid) {
      FirebaseMessaging.onMessage.listen(display);
    }else{
      FirebaseMessaging.onMessage.listen(display);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  static void display(RemoteMessage message) async {
  debugPrint("Notification....${message.data}");
    try {
      Random random = Random();
      int id = random.nextInt(1000);
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: false,
            presentSound: true,
            presentBanner: false,
          //  sound: "assets/images/sound.mp3"
        ),
      );
      await _flutterLocalNotificationsPlugin.show(
        id,
        message.notification?.title ?? 'N/A',
        message.notification?.body ?? 'N/A',
        notificationDetails,
        payload: message.data.toString(),
      );

    } on Exception catch (e) {
      debugPrint('Error>>>$e');
    }
  }

  /// Display notification
  static Future<void> displayNotification(RemoteMessage message) async {
    Random random = Random();
    int id = random.nextInt(1000);
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
       id ,// Unique ID
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
  static  handleResponse(NotificationResponse value,String pre,String navigate) async{
    var s = value.payload.toString();
    var kv = s.substring(0,s.length-1).substring(1).split(", ");
    final Map<String, String> pairs = {};
    for (int i=0; i < kv.length;i++){
      var thisKV = kv[i].split(":");
      pairs[thisKV[0]] =thisKV[1].trim();
    }
    var encoded = json.encode(pairs);
    var jsonResponse = convert.jsonDecode(encoded);

    NotificationModel model = NotificationModel.fromJson(jsonResponse);
    navigateToScreen(model);

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
     // final data = message.data;

     // final data = jsonDecode(message.data.toString()) as Map<String, dynamic>;
      debugPrint("Message Data1: ${message.data}");
      NotificationModel model = NotificationModel.fromJson(message.data);
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
      } else if (clickType == "Share Story Detail!") {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => StoriesDetailsView(model: StoryModel(id: model.storyId),type: 'Notification')),
              (_) => false,
        );
      }
      else {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashBoardView(pageIndex: 0,)),
              (_) => false,
        );
      }
    } catch (e) {
      debugPrint('Navigation Error: $e');
    }
  }

  /// Handle initial message when the app is terminated
  static void handleInitialMessage(RemoteMessage? message) {
    debugPrint("Initial Message: $message");
    if (message != null) {
      debugPrint("Initial Message: ${message.data}");
      handleMessage(message);
    }
  }
}
