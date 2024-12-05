import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/app_localization.dart';
import 'package:cooking_champs/constant/stringfile.dart/locale_constant.dart';
import 'package:cooking_champs/services/notification_services.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'firebase_options.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// //  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
//   runApp(const MyApp());
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]);
// }

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  debugPrint('---_backgroundHandler--${message.data}-');
  await Firebase.initializeApp();
  // setupLocator();
  NotificationService.handleMessage(message);
}

Future<void> _initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

  // Set system UI overlays
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor: MyColors.bg,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
}

void main() async {
  await _initializeApp();
  NotificationService().initialize(); // Initialize the notification service
    runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}







/*import 'package:cooking_champs/constant/stringfile.dart/app_localization.dart';
import 'package:cooking_champs/platform/android.dart';
import 'package:cooking_champs/remote_message_widget.dart';
import 'package:cooking_champs/text_row.dart';
import 'package:cooking_champs/views/splash.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push/push.dart';

void main() async {
  // Need to "ensureInitialized" before initializing `flutter_local_notifications`
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(await initializeFlutterLocalNotifications()));
}*/

// Only needed for foreground notifications.
/*Future<FlutterLocalNotificationsPlugin>
initializeFlutterLocalNotifications() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  // 'mipmap/ic_launcher' taken from https://github.com/MaikuB/flutter_local_notifications/issues/32#issuecomment-389542800
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('mipmap/ic_launcher');
  // Prevent FLN from requesting permission from the user when the app launches.
  const DarwinInitializationSettings initializationSettingsApple =
  DarwinInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false);
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsApple,
      macOS: initializationSettingsApple);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  return flutterLocalNotificationsPlugin;
}*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }
  @override
  void initState() {
    Utility.getId();
    Utility.getFcm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Cooking Champs',
      theme: ThemeData(
        dialogTheme: DialogTheme(
            backgroundColor: MyColor.white
        ),
        scaffoldBackgroundColor: MyColor.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        primarySwatch: const MaterialColor(
          0xffFD7418,
          <int, Color>{
            50: Color(0xff48335C),
            100: Color(0xff48335C),
            200: Color(0xff48335C),
            300 :Color(0xff48335C),
            400 :Color(0xff48335C),
            500 :Color(0xff48335C),
            600 :Color(0xff48335C),
            700 :Color(0xff48335C),
            800 :Color(0xff48335C),
            900 :Color(0xff48335C)
          },
        ),
        useMaterial3: true,
      ),
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      home: const SplashView(),
    );
  }
}

/*
class MyApp extends HookWidget {
  const MyApp(this.flutterLocalNotificationsPlugin, {Key? key})
      : super(key: key);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Widget build(BuildContext context) {
    final notificationWhichLaunchedApp = useState<Map<String?, Object?>?>(null);
    final messagesReceived = useState<List<RemoteMessage>>([]);
    final backgroundMessagesReceived = useState<List<RemoteMessage>>([]);
    final tappedNotificationPayloads =
    useState<List<Map<String?, Object?>>>([]);
    final isForegroundNotificationsEnabled = useState(true);

    useEffect(() {
      configureAndroidPushNotificationChannels();

      // To be informed that the device's token has been updated by the operating system
      // You should update your servers with this token
      final onNewTokenSubscription = Push.instance.onNewToken.listen((token) {
        print("Just got a new token: $token");
      });

      // Handle notification launching app from terminated state
      Push.instance.notificationTapWhichLaunchedAppFromTerminated.then((data) {
        if (data == null) {
          print("App was not launched by tapping a notification");
        } else {
          print('Notification tap launched app from terminated state:\n'
              'Data: $data \n');
        }
        notificationWhichLaunchedApp.value = data;
      });

      // Handle notification taps
      final onNotificationTapSubscription =
      Push.instance.onNotificationTap.listen((data) {
        print('Notification was tapped:\n'
            'Data: $data \n');
        tappedNotificationPayloads.value += [data];
      });

      // Handle push notifications
      final unsubscribeOnMessage = Push.instance.addOnMessage((message) {
        print('RemoteMessage received while app is in foreground:\n'
            'RemoteMessage.Notification: ${message.notification} \n'
            ' title: ${message.notification?.title.toString()}\n'
            ' body: ${message.notification?.body.toString()}\n'
            'RemoteMessage.Data: ${message.data}');
        messagesReceived.value += [message];
        // Push Notifications won't be shown by default when the app is in the foreground.
        // TODO use the state to show local notification.
        if (message.notification != null &&
            isForegroundNotificationsEnabled.value) {
          displayForegroundNotification(message.notification!);
        }
      });

      // Handle push notifications
      final unsubscribeOnBackgroundMessage =
      Push.instance.addOnBackgroundMessage((message) {
        print('RemoteMessage received while app is in background:\n'
            'RemoteMessage.Notification: ${message.notification} \n'
            ' title: ${message.notification?.title.toString()}\n'
            ' body: ${message.notification?.body.toString()}\n'
            'RemoteMessage.Data: ${message.data}');
        backgroundMessagesReceived.value += [message];
      });

      return () {
        onNewTokenSubscription.cancel();
        onNotificationTapSubscription.cancel();
        unsubscribeOnMessage();
        unsubscribeOnBackgroundMessage();
      };
    }, []);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Push Example App'),
        ),
        body: Center(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Instructions',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const Text(
                      "Use the push token below to send messages using the tools provided in the folder called `test_manual/`. You should see these messages arrive to the device, and show up on this screen, based on your actions.")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Options',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Row(
                    children: [
                      Checkbox(
                          value: isForegroundNotificationsEnabled.value,
                          onChanged: (bool? isEnabled) {
                            if (isEnabled != null) {
                              isForegroundNotificationsEnabled.value =
                                  isEnabled;
                            }
                          }),
                      const Text("Show foreground notifications"),
                    ],
                  )
                ],
              ),
              // const NotificationPermissionSliver(),
              // const MetadataSliver(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Messages',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Row(children: [
                      Flexible(
                        child: Text('Recent foreground notification',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      IconButton(
                          onPressed: () {
                            messagesReceived.value = [];
                          },
                          icon: const Icon(Icons.delete))
                    ]),
                    RemoteMessagesWidget(messagesReceived.value),
                    Row(
                      children: [
                        Flexible(
                          child: Text('Recent background notification',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        IconButton(
                            onPressed: () {
                              backgroundMessagesReceived.value = [];
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    RemoteMessagesWidget(backgroundMessagesReceived.value),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Notification Taps',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const Text("Notifications are only shown when the app is "
                        "terminated or in the background. If you want to "
                        "show a notification when the app is running, you "
                        "have to manually create the notification."),
                    const Text(
                        "Only the data property (payloads) is shown when a "
                            "notification is tapped. This is done to make "
                            "behaviour consistent between  iOS and Android. "
                            "To know which notification the user saw/tapped, "
                            "you can duplicate the title/body in the data "
                            "payload - redundant I know."),
                    Text('Notification which launched app',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const Text(
                        "There can only be 1 notification which launched your app."),
                    Text((notificationWhichLaunchedApp.value != null)
                        ? notificationWhichLaunchedApp.value.toString()
                        : "The app was not launched by an app pressing the notification."),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                              'All notifications tapped since app launch',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        IconButton(
                            onPressed: () {
                              tappedNotificationPayloads.value = [];
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    buildTappedNotificationsSliver(
                        context, tappedNotificationPayloads.value),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTappedNotificationsSliver(BuildContext context,
      List<Map<String?, Object?>> tappedNotificationPayloads) {
    if (tappedNotificationPayloads.isEmpty) {
      return const Text("No payloads");
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ...tappedNotificationPayloads
                  .map((data) => TextRow("Data", data.toString()))
                  .toList()
            ],
          ),
        ],
      );
    }
  }

  void displayForegroundNotification(Notification notification) async {
    final androidOptions =
    AndroidNotificationDetails(debugChannel.id, debugChannel.name,
        channelDescription: debugChannel.description,
        importance: Importance.max,
        priority: Priority.high,
        ticker: "A manually-sent push notification.",
        styleInformation: const DefaultStyleInformation(
          false,
          false,
        ));
    const iosOptions = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    final platformChannelSpecifics =
    NotificationDetails(android: androidOptions, iOS: iosOptions);
    await flutterLocalNotificationsPlugin.show(
        0, notification.title, notification.body, platformChannelSpecifics);
  }
}*/
