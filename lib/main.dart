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

/// Background message handler
@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  debugPrint('Background Message Received: ${message.data}');
  await Firebase.initializeApp();
  // NotificationService().handleMessage(message);
}

Future<void> _initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Set background message handler
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

  // Initialize notification service
  await NotificationService().initialize();

  // Set system UI overlays
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor: MyColors.bg,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
}

void main() async {
 // await _initializeApp();
    runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}



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
