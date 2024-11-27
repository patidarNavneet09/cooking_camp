import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cooking_champs/constant/apiConnectorConstants.dart';
import 'package:cooking_champs/constant/stringfile.dart/all_key.dart';
import 'package:cooking_champs/constant/stringfile.dart/locale_constant.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';


class HttpServices {
  // Utility function to convert model to Map if it's not already a Map
 static Map<String, dynamic> toMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    } else  {
      return data.toJson(); // Assuming `ModelRequest` has a `toJson()` method
    }
  }


  static Future<dynamic> getDataObjectFromAPI(
      BuildContext context, String url, bool load) async {
    final language = await PreferencesServices.getPreferencesData(prefSelectedLanguageCode)??"en";
    ApiConnectorConstants.accessToken = await PreferencesServices.getPreferencesData(PreferencesServices.userToken)??"";
    if (context.mounted) {
      load? AllDialogs.progressLoadingDialog(context, true):null;
    }
    debugPrint("url.....${'${ApiPath.baseUrl}$url'}....${ApiConnectorConstants.accessToken}");
    try {
      var headers = {
        "Accept": "application/json",
        "X-CLIENT": ApiConnectorConstants.apiKey};

      if (language.isNotEmpty) {
        headers.addAll({"Accept-Language": language});
      }
      if (ApiConnectorConstants.accessToken.isNotEmpty) {
        headers.addAll({"Authorization": "Bearer ${ApiConnectorConstants.accessToken}"});
      }
      var response =
      await http.get(Uri.parse('${ApiPath.baseUrl}$url'), headers: headers);
      load ? AllDialogs.progressLoadingDialog(context, false) : null;
      debugPrint(response.body);
      var jsonResponse = convert.jsonDecode(response.body);
      debugPrint("jsonResponse.......${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("jsonResponse.......$jsonResponse");
        return jsonResponse;
      }else{
        Utility.userNotExit(context,jsonResponse['message'].toString());
      }
    } on SocketException catch (e) {
      throw Exception(e);
    }
    return;
  }

  static Future<dynamic> deleteApi(
      BuildContext context, String url, bool successStatus) async {
    final language = await PreferencesServices.getPreferencesData(prefSelectedLanguageCode)??"en";
    ApiConnectorConstants.accessToken = await PreferencesServices.getPreferencesData(PreferencesServices.userToken)??"";
    if (context.mounted) {
       AllDialogs.progressLoadingDialog(context, true);
    }
    debugPrint("headers.......${ApiConnectorConstants.accessToken}");
    debugPrint("url......${'${ApiPath.baseUrl}$url'}");

    try {
      var headers = {
        "Accept": "application/json",
        "Content-type":'application/json',
        "X-CLIENT": ApiConnectorConstants.apiKey};

      if (language.isNotEmpty) {
        headers.addAll({"Accept-Language": language});
      }
      if (ApiConnectorConstants.accessToken.isNotEmpty) {
        headers.addAll({"Authorization": "Bearer ${ApiConnectorConstants.accessToken}"});
      }

      var request = http.Request('DELETE', Uri.parse('${ApiPath.baseUrl}$url'));
      if (ApiConnectorConstants.accessToken.isNotEmpty) {
        request.headers.addAll(
            {"Authorization": "Bearer ${ApiConnectorConstants.accessToken}"});
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (context.mounted) {
        AllDialogs.progressLoadingDialog(context, false);
      }
      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();

        var jsonResponse = json.decode(responseString);

        return jsonResponse;
      } else {
        print("multipartHttp${response.reasonPhrase}");
      }
    } on SocketException catch (e) {
      debugPrint("e......$e");
      throw Exception(e);
    }
    return;
  }

  static Future<dynamic> postApi(BuildContext context, String url, dynamic requestModel, bool load) async {
    final language = await PreferencesServices.getPreferencesData(prefSelectedLanguageCode)??"en";
     ApiConnectorConstants.accessToken = await PreferencesServices.getPreferencesData(PreferencesServices.userToken)??"";
    final requestData = toMap(requestModel); // Convert data to Map if it's a model
    if (context.mounted) {
     load? AllDialogs.progressLoadingDialog(context, true):null;
    }
    debugPrint("headers.......${ApiConnectorConstants.accessToken}");
    debugPrint("url......${'${ApiPath.baseUrl}$url'}");
    
    try {
      var headers = {
        "Accept": "application/json",
        "Content-type":'application/json',
        "X-CLIENT": ApiConnectorConstants.apiKey};

      if (language.isNotEmpty) {
        headers.addAll({"Accept-Language": language});
      }
      if (ApiConnectorConstants.accessToken.isNotEmpty) {
        headers.addAll({"Authorization": "Bearer ${ApiConnectorConstants.accessToken}"});
      }
      var request = http.Request('POST', Uri.parse('${ApiPath.baseUrl}$url'));
      request.body = json.encode(requestData);
      request.headers.addAll(headers);
      debugPrint("Request.......${json.encode(requestData)}");
      http.StreamedResponse response = await request.send();

      String responseString = await response.stream.bytesToString();
      if (context.mounted) {
        load? AllDialogs.progressLoadingDialog(context, false):null;
      }
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(responseString);
        debugPrint("Response.......$jsonResponse");
        return jsonResponse;
      } else if(response.statusCode == 401 || response.statusCode == 400){
        var jsonResponse = json.decode(responseString);
        debugPrint("jsonResponse['message']...$jsonResponse");
        Utility.userNotExit(context, jsonResponse['message'].toString());
        return jsonResponse;
      }

    } on SocketException catch (e) {
      debugPrint("e......$e");
      throw Exception(e);
    }
    return;
  }

  ///--------------Multipart Method-----------------------

  static Future<dynamic> multiPartMethod(
      BuildContext context,
      String url,
      Map<String, dynamic> body,
      var image,
      var images,
      bool load,
      String type,
      String key) async {
    final language = await PreferencesServices.getPreferencesData(prefSelectedLanguageCode) ?? "en";
    ApiConnectorConstants.accessToken = await PreferencesServices.getPreferencesData(PreferencesServices.userToken)??"";
    try {
      var headers = {
        "Accept": "application/json",
       "X-CLIENT": ApiConnectorConstants.apiKey};

      if (language.isNotEmpty) {
        headers.addAll({"Accept-Language": language});
      }
      if (ApiConnectorConstants.accessToken.isNotEmpty) {
        headers.addAll({"Authorization": "Bearer ${ApiConnectorConstants.accessToken}"});
      }
      if (context.mounted && load) {
        AllDialogs.progressLoadingDialog(context, true);
      }

      debugPrint('Post Url:   $image....${ApiPath.baseUrl}$url');
      debugPrint('headers: ${headers.toString()}');
      log('Params: $body');

      var apiUrl = Uri.parse('${ApiPath.baseUrl}$url');
      var request = http.MultipartRequest('POST', apiUrl);

      // Convert body to Map<String, String>
      request.fields.addAll(body.map((key, value) => MapEntry(key, value.toString())));
      request.headers.addAll(headers);

      if (type == "list" && image.isNotEmpty) {
        for (var img in image) {
          uploadImage(img, request,key);
        }
      } else if(image != null) {
        uploadImage(image, request,key);
      }

      if (images.isNotEmpty) {
        for(int i = 0; images.length> i; i++){
          uploadImages(images[i], request,i);
        }
      }

      var response = await request.send();
      debugPrint("Response: $response");

      if (context.mounted && load) {
        AllDialogs.progressLoadingDialog(context, false);
      }
      String responseString = await response.stream.bytesToString();
      print("Response.......$responseString");
      var jsonResponse = json.decode(responseString);

      return jsonResponse;
    } on SocketException catch (e) {
      debugPrint("SocketException: $e");
      throw Exception(e);
    } finally {
      // Optionally close dialogs if needed
    }
  }


  static uploadImage(var img, var request,String key) async {
    debugPrint("__${img.path.split("-").last}");
    var stream = http.ByteStream(img.openRead());
    var length = await img.length();
    var contentType = lookupMimeType(img.path) ?? 'image/jpeg';
    request.files.add(http.MultipartFile(
     key == "banner"? AllKeys.bannerImage:AllKeys.image,
      stream,
      length,
      filename: "Image__${img.path.split("-").last}",
      contentType: MediaType.parse(contentType),
    ));
  }

  static uploadImages(var img, var request,int index) async {
    debugPrint("__${img.path.split("-").last}");
    var stream = http.ByteStream(img.openRead());
    var length = await img.length();
    var contentType = lookupMimeType(img.path) ?? 'image/jpeg';
    request.files.add(http.MultipartFile(
      "${AllKeys.images}[$index]",
      stream,
      length,
      filename: "Image__${img.path.split("-").last}",
      contentType: MediaType.parse(contentType),
    ));
  }
}