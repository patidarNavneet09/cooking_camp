import 'package:flutter/cupertino.dart';

abstract class MyStrings {
  static MyStrings? of(BuildContext context) {
    return Localizations.of<MyStrings>(context, MyStrings);
  }

  String get full;
  String get password;
  String get forgotPassword;
  String get donthaveanacco;
  String get signUp;
  String get jointheCookingChamps;
  String get signupforafunand;
  String get firstName;
  String get lastName;
  String get parentEmail;
  String get enterfirstName;
  String get enterlastName;
  String get enterEmail;
  String get emailstar;
  String get passwordstar;
  String get enterpassword;
  String get repeatpassword;
  String get atleast5;
  String get register;
  String get login;
}
