import 'dart:convert';
import 'dart:io';
import 'package:cooking_champs/constant/apiConnectorConstants.dart';
import 'package:cooking_champs/constant/app_state.dart';
import 'package:cooking_champs/model/common_response.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/model/dynamic_models/register_identity_model.dart';
import 'package:cooking_champs/model/dynamic_models/update_parent_profile_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/model/post_model/add_recipe_request.dart';
import 'package:cooking_champs/model/post_model/add_stories_request.dart';
import 'package:cooking_champs/model/post_model/change_pass_model.dart';
import 'package:cooking_champs/model/post_model/kids_register_model.dart';
import 'package:cooking_champs/model/post_model/login_request_model.dart';
import 'package:cooking_champs/model/post_model/otp_verify_request.dart';
import 'package:cooking_champs/model/post_model/parent_register_model.dart';
import 'package:cooking_champs/model/post_model/reset_pass_request.dart';
import 'package:cooking_champs/model/post_model/send_friend_request.dart';
import 'package:cooking_champs/model/post_model/update_kid_profile_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/http_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:flutter/material.dart';

class ApiServices {
  static Future<CommonResponse> parentRegister(BuildContext context,
      ParentRegisterModel parentRegisterModel, var image) async {
    bool status = false;
    String url = ApiPath.registerParent;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.multiPartMethod(
          context, url, parentRegisterModel.toJson(), image,[], true, "","image");
      if (response != null) {
        commonResponse = CommonResponse.fromJson(response);
        debugPrint("response...$response");
        if (commonResponse.data != null) {
          UserIdentityModel model =
          UserIdentityModel.fromJson(commonResponse.data);
          checkLoginResult(model);
        }
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }



  static Future<CommonResponse> kidsRegister(
      BuildContext context, KidsRegisterModel kidsModel, var image) async {
    bool status = false;
    String url = ApiPath.registerKids;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.multiPartMethod(
          context, url, kidsModel.toJson(), image,[], true, "","image");
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.data != null) {
          RegisterIdentityModel model = RegisterIdentityModel.fromJson(commonResponse.data);
          //  checkLoginResult(model);
        }
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }



  static Future<CommonResponse> myChildListRequest(BuildContext context,bool load) async {
    String url = ApiPath.myChildListing;
    CommonResponse commonResponse = CommonResponse();
    try {
      var jsonResponse =
          await HttpServices.getDataObjectFromAPI(context, url, load);
      if (jsonResponse != null) {
        commonResponse = CommonResponse.fromJson(jsonResponse);
      }
    } on Exception catch (e) {
      //  Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> loginRequest(
      BuildContext context, LoginRequestModel loginModel) async {
    String url = ApiPath.login;
    var request = loginModel.toJson();
    debugPrint("request $request");
    CommonResponse commonResponse = CommonResponse();
    try {
      var jsonResponse = await HttpServices.postApi(context, url, loginModel.toJson(), true);
      if (jsonResponse != null) {
        commonResponse = CommonResponse.fromJson(jsonResponse);
        Utility.customToast(context, commonResponse.message ?? "");

        if (jsonResponse['data'] != null) {
          if (jsonResponse['data'] is List) {
            List<UserIdentityModel> userModelList =
                (jsonResponse['data'] as List)
                    .map((item) => UserIdentityModel.fromJson(item))
                    .toList();
          } else if (jsonResponse['data'] is Map) {
            UserIdentityModel userModel = UserIdentityModel.fromJson(jsonResponse['data']);
            checkLoginResult(userModel);
          }
        }
      }
    } on Exception catch (e) {
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

  static Future<void> checkLoginResult(
      UserIdentityModel loginResultData) async {
    try {
      debugPrint("loginResultData.id.....${loginResultData.id}");

      if (loginResultData.id != null || loginResultData.id!.isNotEmpty) {
        AppState.current.loginUserIdentityDetails = loginResultData;
        PreferencesServices.setPreferencesData(PreferencesServices.isLogin, true);
        PreferencesServices.setPreferencesData(PreferencesServices.userToken, loginResultData.token);
        PreferencesServices.setPreferencesData(PreferencesServices.parentId, loginResultData.id);
        // Reset any email error display logic here if necessary
        bool showEmailError = false;
        if (AppState.current.loginUserIdentityDetails != null) {
          // Save the login user identity details to SharedPreferences
          PreferencesServices.setPreferencesData(
              PreferencesServices.loginUserIdentityDetails,
              jsonEncode(AppState.current.loginUserIdentityDetails!.toJson()));
        }
      } else {
        AppState.current.loginUserIdentityDetails = loginResultData;
      }
    } catch (e) {
      // Handle exception and logging here
      debugPrint(e.toString());
    }
  }

  static Future<CommonResponse> logoutRequest(
      BuildContext context, LoginRequestModel loginModel) async {
    String url = ApiPath.logout;
    var request = loginModel.toJson();
    debugPrint("request $request");
    CommonResponse commonResponse = CommonResponse();
    try {
      var jsonResponse =
          await HttpServices.postApi(context, url, loginModel.toJson(), true);

      if (jsonResponse != null) {
        commonResponse = CommonResponse.fromJson(jsonResponse);
      }
    } on Exception catch (e) {
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> userDetail(
      BuildContext context, String kidId, bool load) async {
    CommonResponse commonResponse = CommonResponse();
    String url = "";
    if (kidId.isNotEmpty) {
      url = ApiPath.userDetail + kidId;
    } else {
      url = ApiPath.userDetail;
    }
    try {
      var response =
          await HttpServices.getDataObjectFromAPI(context, url, load);
      if (response != null) {
        commonResponse = CommonResponse.fromJson(response);
        UserIdentityModel userModel = UserIdentityModel.fromJson(commonResponse.data);
        PreferencesServices.setPreferencesData(PreferencesServices.loginUserIdentityDetails, jsonEncode(userModel.toJson()));
      }
    } on SocketException catch (e) {}
    return commonResponse;
  }

  static Future<CommonResponse> updateUserProfile(BuildContext context,
      UpdateParentProfileModel updateModel, var image) async {
    String url = ApiPath.updateProfile;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.multiPartMethod(
          context, url, updateModel.toJson(), image,[], true, "","image");
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.data != null) {
         // RegisterIdentityModel model = RegisterIdentityModel.fromJson(commonResponse.data);
          UserIdentityModel userModel = UserIdentityModel.fromJson(commonResponse.data);
          debugPrint("userModel...${userModel.name}");
          PreferencesServices.setPreferencesData(PreferencesServices.loginUserIdentityDetails, jsonEncode(userModel.toJson()));
        }

        Utility.userNotExit(context, commonResponse.message ?? "");
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> updateKidProfile(
      BuildContext context, KidsRegisterModel updateModel, var image) async {
    String url = ApiPath.updateProfile;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.multiPartMethod(
          context, url, updateModel.toJson(), image,[], true, "","image");
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.data != null) {
          RegisterIdentityModel model =
              RegisterIdentityModel.fromJson(commonResponse.data);
        }

        Utility.userNotExit(context, commonResponse.message ?? "");
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> changePassword(
      BuildContext context, ChangePasswordModel changePassModel) async {
    String url = ApiPath.changePassword;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.postApi(
          context, url, changePassModel.toJson(), true);
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> deleteAccount(BuildContext context) async {
    String url = ApiPath.deleteAccount;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.postApi(context, url, null, true);
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> deleteKid(
      BuildContext context, UpdateKidProfile deleteModel) async {
    String url = "${ApiPath.deleteKid}?kid_id=${deleteModel.kidId}";
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.deleteApi(context, url, true);
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> forgotPassword(
      BuildContext context, LoginRequestModel forgotPassRequest) async {
    String url = ApiPath.forgotPassword;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.postApi(
          context, url, forgotPassRequest.toJson(), true);
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.errors.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> otpVerify(
      BuildContext context, OtpRequestModel otpRequest) async {
    String url = ApiPath.otpVerify;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response =
          await HttpServices.postApi(context, url, otpRequest.toJson(), true);
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.message.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> resetPassword(
      BuildContext context, ResetPasswordRequest resetPassRequest) async {
    String url = ApiPath.resetPassword;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.postApi(
          context, url, resetPassRequest.toJson(), true);
      if (response != null) {
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
        if (commonResponse.errors != null) {
          Utility.customToast(context, commonResponse.message.toString());
        }
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return commonResponse;
  }

  static Future<CommonResponse> addStories(BuildContext context,AddStoriesRequest addStoriesRequest,var image,var images) async {
    String url = ApiPath.addStories;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.multiPartMethod(context, url,addStoriesRequest.toJson(),image,images,true,"","image");
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> getStoryList(BuildContext context,String page,bool load) async {
    String url = "${ApiPath.storyListing}?page=$page";
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.getDataObjectFromAPI(context, url,load);

      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
        debugPrint("story...${commonResponse.status}");

      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> getStoryDetail(BuildContext context,bool load,String storyId) async {
    String url = "${ApiPath.storyDetail}?story_id=$storyId";
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.getDataObjectFromAPI(context, url,load);

      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
        debugPrint("story...${commonResponse.status}");

      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }


  static Future<CommonResponse> getRecipeTools(BuildContext context,bool load)async{
    String url = ApiPath.recipeTools;
    CommonResponse commonResponse = CommonResponse();
    try{
      var response = await HttpServices.getDataObjectFromAPI(context, url, load);
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> addRecipe(BuildContext context,AddRecipeRequest addRecipeRequest,var image) async {
    String url = ApiPath.addRecipe;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.multiPartMethod(context, url,addRecipeRequest.toJson(),image,[],true,"","banner");
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> getRecipeList(BuildContext context,String page,bool load,String type) async {
    String url = "${ApiPath.getRecipe}?page=$page&type=$type";
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.getDataObjectFromAPI(context, url,load);

      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
        debugPrint("recipe...${commonResponse.data}");

      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> getRecipeDetail(BuildContext context,bool load,String recipeId) async {
    String url = "${ApiPath.recipeDetail}?recipe_id=$recipeId";
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.getDataObjectFromAPI(context, url,load);

      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
        debugPrint("recipe detail...${commonResponse.status}");

      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> getAboutUs(BuildContext context,bool load,String id) async {
    String url = "${ApiPath.aboutUs}?id=$id";
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.getDataObjectFromAPI(context, url,load);

      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
        debugPrint("aboutUs...${commonResponse.status}");

      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> getHelpAndSupport(BuildContext context,bool load) async {
    String url = ApiPath.helpSupport;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.getDataObjectFromAPI(context, url,load);

      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
        debugPrint("recipe detail...${commonResponse.status}");

      }
    } on SocketException catch (e) {
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
  }

static Future<CommonResponse> addToFavorite(BuildContext context,var request,bool load)async{
    String url = ApiPath.addToFavorites;
    CommonResponse commonResponse = CommonResponse();

    try{
      var response = await HttpServices.postApi(context, url, request.toJson(),load);
      if(response.toString() != "null"){
        debugPrint("response...$response");
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context,e.toString());
    }
    return commonResponse;
}

static Future<CommonResponse> getFavoriteList(BuildContext context,bool load) async{
    String url = ApiPath.favoritesListing;
    CommonResponse commonResponse = CommonResponse();
    try{
      var response = await HttpServices.getDataObjectFromAPI(context, url, load);
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
}

static Future<CommonResponse> sendRequest(BuildContext context,SendFriendRequest requestModel)async{
    String url = ApiPath.sendFriendRequest;
    CommonResponse commonResponse = CommonResponse();
    try{
      var response  = await HttpServices.postApi(context, url,requestModel.toJson(),true);
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
}

  static Future<CommonResponse> getFriendsRequest(BuildContext context,int page,bool load,String type) async{
    String url = "${ApiPath.friendRequest}?type=$type";
    CommonResponse commonResponse = CommonResponse();
    try{
      var response = await HttpServices.getDataObjectFromAPI(context, url, load);
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> acceptRejectFriendsRequest(BuildContext context,var requestModel,bool load) async{
    String url = ApiPath.acceptFriendRequest;
    CommonResponse commonResponse = CommonResponse();
    try{
      var response = await HttpServices.postApi(context, url,requestModel.toJson(), load);
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> getNotification(BuildContext context,bool load,int page)async{
    String url = "${ApiPath.notificationListing}?page=$page";
    CommonResponse commonResponse = CommonResponse();
    try{
      var response = await HttpServices.getDataObjectFromAPI(context, url, load);
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

  static Future<CommonResponse> countFriendRequest(BuildContext context,bool load) async{
   String url = ApiPath.friendRequestCount;
   CommonResponse commonResponse = CommonResponse();
   try {
     var response = await HttpServices.getDataObjectFromAPI(context, url, load);
     if(response.toString() != "null"){
       commonResponse = CommonResponse.fromJson(response);
     }
   }on SocketException catch(e){
     Utility.customToast(context, e.toString());
   }
   return commonResponse;
  }

  static Future<CommonResponse> shareFriends(BuildContext context,var request)async{
    String url = ApiPath.shareStories;
    CommonResponse commonResponse = CommonResponse();
    try {
      var response = await HttpServices.postApi(context, url, request, true);
      if(response.toString() != "null"){
        commonResponse = CommonResponse.fromJson(response);
      }
    }on SocketException catch(e){
      Utility.customToast(context, e.toString());
    }
    return commonResponse;
  }

}
