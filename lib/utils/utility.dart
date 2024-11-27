import 'dart:io';

import 'package:cooking_champs/constant/app_state.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utility {

  // Define a list of colors
  List<Color> colorList = [
    MyColor.blueLite,
    MyColor.colorFFFED6,
    MyColor.colorE2EBFF,
    MyColor.liteOrange,
    MyColor.colorE2FFE4,
    MyColor.colorFFD6D6
  ];

// Function to get color based on the index
  Color getColorForIndex(int index) {
    return colorList[index % colorList.length];
  }

  ///.....FCM Token........................
  static Future<String?> getFcm() async {
   String? token = await FirebaseMessaging.instance.getToken();
    debugPrint("fcm token.....$token");
   String fcmToken = "123456";
   PreferencesServices.setPreferencesData(PreferencesServices.fcm,token);
    return token;
  }

  static getId() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      final WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      AppState.deviceIdentifier = webInfo.vendor! +
          webInfo.userAgent! +
          webInfo.hardwareConcurrency.toString();
    } else {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        AppState.deviceIdentifier = androidInfo.id;
        AppState.devicetype = "android";
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        AppState.deviceIdentifier = iosInfo.identifierForVendor!;
        AppState.devicetype = "ios";
      } else if (Platform.isLinux) {
        final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
        AppState.deviceIdentifier = linuxInfo.machineId!;
      }
      setDeviceId(AppState.deviceIdentifier);
    }
  }

  /// get Device Id..............
  static  setDeviceId(String id) async {
    AppState.deviceIdStr = id;
    PreferencesServices.setPreferencesData(PreferencesServices.deviceId, id.toString());
    PreferencesServices.setPreferencesData(PreferencesServices.deviceType, AppState.devicetype);
  }

  static void customToast(BuildContext context, String msg) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.81, // Customize this value to adjust the position
        left: MediaQuery.of(context).size.width * 0.1, // Centering the toast
        right: MediaQuery.of(context).size.width * 0.1, // Centering the toast
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: MyColor.appTheme,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              msg,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }


  ///.......Email validation...............
  static String validateEmail(BuildContext context,String value) {
    if (value.trim().isEmpty) {
      return Languages.of(context)!.emailIsRequired;
    }
    if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
      return Languages.of(context)!.invalidEmail;
    }
    return "null";
  }

  static userNotExit(BuildContext context,String message){
    if(message == "Unauthenticated."){
      PreferencesServices.setLogoutPreferencesData();
      CustomNavigators.pushRemoveUntil(LoginView(), context);
    }
  }

  static String formatDateToMonthDay(String date) {
    if (date.isNotEmpty) {
      // Parse the date string into a DateTime object
      DateTime dateTime = DateTime.parse(date);

      // Format the date to "MMM dd" (e.g., "Mar 03")
      String formattedDate = DateFormat("MMMM").format(dateTime);

      return formattedDate;
    }
    return "";
  }
  static String formatDateToMonthDay1(String date) {
    final parsedDate = DateTime.parse(date);
    return "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}";
  }

 static String removeHtmlTag(String str) {
    String result = '';
    final document = parse(str);
    if (document.body != null) {
      result = parse(document.body!.text).documentElement!.text;
    }
    return result;
  }

  // Function to convert a hex color string to a Color object
 static Color hexToColor(String hexString) {
    // Validate the format using regex
    final validHexColor = RegExp(r'^#(?:[0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
    if (!validHexColor.hasMatch(hexString)) {
      throw ArgumentError('Invalid hex color format');
    }

    // Remove the '#' and convert to a full 6-digit format if necessary
    String hex = hexString.replaceFirst('#', '');
    if (hex.length == 3) {
      hex = hex.split('').map((char) => '$char$char').join();
    }

    // Convert hex to Color
    return Color(int.parse('0xFF$hex'));
  }
  /// Count words in a given text
  int countWords(String text) {
    if (text.isEmpty) return 0;
    return text
        .trim()
        .split(RegExp(r'\s+')) // Split by spaces or newlines
        .length;
  }

}