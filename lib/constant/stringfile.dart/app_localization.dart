import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/constant/stringfile.dart/language_en.dart';
import 'package:flutter/material.dart';


class AppLocalizationsDelegate extends LocalizationsDelegate<Languages>{

  const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ["en"].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguagesEN();
      default:
        return LanguagesEN();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Languages> old)=> false;



}

