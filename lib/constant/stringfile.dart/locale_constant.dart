import 'dart:ui';
import 'package:cooking_champs/main.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:flutter/cupertino.dart';



const String prefSelectedLanguageCode = "SelectedLanguageCode";
Future<Locale> setLocale(String languageCode) async {
  PreferencesServices.setPreferencesData(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  String languageCode = await PreferencesServices.getPreferencesData(prefSelectedLanguageCode)?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode != null && languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : Locale('en', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  var _locale = await setLocale(selectedLanguageCode);
  // MyApp.setLocale(context, _locale);
}