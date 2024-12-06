import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get welcomeBack;
  String get hey;
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
  String get pleaseEnterOtp;
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
  String get memories;
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
  String get enterTheNameIfYourRecipe;
  String get toolsUsed;
  String get ingredients;
  String get enterIngredients;
  String get enterCookYourRecipe;
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

  String get createKidProfile;
  String get updateKidProfile;
  String get firstNamee;
  String get year;
  String get classgrade;
  String get optional;
  String get enterclassgrade;
  String get childprofilecreated;
  String get childProfileUpdated;
  String get okay;
  String get sendRequest;
  String get follow;
  String get cancelRequest;
  String get unFallow;
  String get friend;
  String get myKids;
  String get friendRequest;
  String get addkidsmore;
  String get addAnotherKid;
  String get editKidProfile;
  String get myFriends;
  String get request;
  String get searchFriends;
  String get searchByName;
  String get invalidEmail;
  String get emailIsRequired;
  String get pleaseEnterFirstName;
  String get pleaseEnterLastName;
  String get pleaseEnterParentEmail;
  String get pleaseEnterEmail;
  String get pleaseUploadProfile;
  String get confirmPassNotMatch;
  String get enterGrade;
  String get enterYear;
  String get enterUserName;
  String get enterName;
  String get parent;
  String get kids;
  String get newConPAssNotMatch;
  String get areYouSureDeleteAccount;
  String get areYouSureDeleteKidProfile;
  String get deleteKid;
  String get bestFromTheChamps;
  String get noRecipesYet;
  String get youHavenAddedAnyRecipesYet;
  String get share;
  String get tapToSelectAndShare;
  String get whatInside;
  String get rhymingRulesForTheCookingChampsKitchen;
  String get cookingChampsKitchenRulesChart;
  String get knifeSafetySkillsChart;
  String get activities;
  String get glossary;
  String get quiz;
  String get question1;
  String get question2;
  String get question3;
  String get question4;
  String get question5;
  String get question6;
  String get question7;
  String get question8;
  String get question9;
  String get question10;
  String get question11;
  String get question12;
  String get answer1;
  String get answer2;
  String get answer3;
  String get answer4;
  String get answer5;
  String get answer6;
  String get answer7;
  String get answer8;
  String get answer9;
  String get answer10;
  String get answer11;
  String get answer12;
  String get chemical;
  String get somethingYouCan;
  String get extension;
  String get hazard;
  String get dangerOrRisk;
  String get rules;
  String get aLawOrDirectionThatTellsUsHow;
  String get somethingExtraAnAddition;
  String get aListOfTheHardOrUnusualWords;
}
