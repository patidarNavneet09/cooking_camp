
import 'package:cooking_champs/model/dynamic_models/register_identity_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';

class AppState{
  static final AppState _singleton = AppState._internal();
  static AppState get current => _singleton;
  RegisterIdentityModel? registerUserIdentityDetails;
  UserIdentityModel? loginUserIdentityDetails;
  AppState._internal();


  static  String deviceIdentifier = "";
  static  String devicetype = "";
  static  String deviceIdStr = "";
}