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
  String get enterpasswordstar;
  String get repeatpassword;
  String get atleast5;
  String get register;
  String get login;
  String get logout;
  String get dontworryEnteryouremail;
  String get email;
  String get continuee;
  String get youremailisontheway;
  String get didntreceivedanymail;
  String get resend;
  String get enterOTP;
  String get verification;
  String get enterOTPCode;
  String get submit;
  String get oTPVerified;
  String get yourOTPhasbeensuccessfullyverified;
  String get resetPassword;
  String get confirmnewPassword;
  String get newPassword;
  String get enterpassword;
  String get passwordchanged;
  String get yourpasswordhasbeensuccessfullyreset;
  String get gotoLogin;
  String get home;
  String get recipe;
  String get save;
  String get menu;
  String get explore;
  String get kidLearning;
  String get ourStories;
  String get aboutUs;
  String get editProfile;
  String get changePassword;
  String get helpSupport;
  String get deleteAccount;
  String get support;
}
