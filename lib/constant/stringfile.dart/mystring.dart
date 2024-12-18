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
  String get noSaveRecipeyet;
  String get youdonthaveanysaved;
  String get viewDetailsarrow;
  String get featuredstories;
  String get popularRecipe;
  String get seeall;
  String get ingredient;
  String get howtoCook;
  String get update;
  String get savePassword;
  String get gotoHome;
  String get kidsLearning;
  String get story;
  String get addarecentmoment;
  String get openyourphotogalleryto;
  String get addImage;
  String get momentStoryTitle;
  String get max30Words;
  String get yourStoryMoment;
  String get min200Words;
  String get writehere;
  String get add;
  String get addYourStories;
  String get entertitle;
  String get addYourRecipe;
  String get addYourRecentCookingMoments;
  String get openyourphotogallerytorecentrecipe;
  String get recipeName;
  String get enterthenameofyourrecipe;
  String get toolsUsed;
  String get entertheingredientsyouneed;
  String get enterthestepstocookyourrecipe;
  String get introductiontoCookingChamps;
  String get messageforParents;
  String get messagetoCookingChamps;
  String get cookingChampsMoto;
  String get logoutAccount;
  String get areyousureyouwanttologoutyouraccount;
  String get yes;
  String get no;
  String get safetyinthekitchen;
  String get yourStories;
  String get nostoriesYet;
  String get youhaventaddedanystoriesyet;
  String get letCreateYourKidChampProfile;

  String get yourChampFullName;
  String get name;

  String get entername;

  String get dateofbirth;

  String get day;
  String get selectyourcampbornday;

  String get month;

  String get selectyourcampmanth;

  String get selectyourcampyear;

  String get whichclassgradearetheyin;

  String get username;

  String get enterusername;

  String get passwordd;

  String get careatekidprifile;
  String get firstNamee;
  String get year;
  String get classgrade;
  String get optional;
  String get enterclassgrade;
  String get childprofilecreated;
  String get okay;
  String get sendRequest;
  String get myKids;
  String get friendRequest;
  String get addkidsmore;
  String get addAnotherKid;
  String get editKidProfile;
  String get myFriends;
  String get request;
  String get searchFriends;
  String get searchbyname;
}
