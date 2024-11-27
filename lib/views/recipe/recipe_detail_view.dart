import 'dart:convert';

import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/enums/register_enum.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/model/post_model/send_friend_request.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class RecipeDetailView extends StatefulWidget {
  final RecipeModel model;
   Color color;
   RecipeDetailView({super.key, required this.model,required this.color});

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  UserIdentityModel userDetails= UserIdentityModel();
  String userResponse = "";
  RecipeModel recipeModel = RecipeModel();
  bool isSent = false;

  @override
  void initState() {
    getUserData();
   Future.delayed(Duration.zero,getRecipeDetail);
    super.initState();
  }
  void getUserData() async{
    var data = await PreferencesServices.getPreferencesData(PreferencesServices.loginUserIdentityDetails);
    if(data != null){
      Map<String, dynamic> jsonResponse = await jsonDecode(data);
      userDetails = UserIdentityModel.fromJson(jsonResponse);
    }
    if(mounted){
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth:size.width * 0.08,
        automaticallyImplyLeading: false,
        backgroundColor:widget.color,
        surfaceTintColor:widget.color,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: const Icon(
              Icons.arrow_back_ios,
              size:28,
              color: Colors.black,
            ),
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.only(left:10),
          child:   Text(
              recipeModel.name??"",
              style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          // padding: EdgeInsets.zero,

          child: Wrap(
        children: [
          Container(
            color: MyColor.liteOrange,
          ),
          Stack(
            children: [
              Container(
                width: size.width,
                height: 280,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color:widget.color,
                ),
                child: Column(
                  children: [
                   hsized20,

                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                        child: UiUtils.networkImages(size.width * 0.60,180,recipeModel.bannerImage != null? ApiPath.imageBaseUrl+recipeModel.bannerImage.toString():"")
                      ),
                    )

                  ],
                ),
              ),

              recipeModel.recipeTools != null &&  recipeModel.recipeTools!.isNotEmpty?
              Container(
                width: size.width,
                height: 325,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  // color: MyColor.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection:Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:List.generate(
                            recipeModel.recipeTools!.length,(i){
                              var tools = recipeModel.recipeTools![i];
                          return Container(
                            width: size.width * 0.20,
                            height: 92,
                            margin: EdgeInsets.only(right:15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: MyColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: MyColor.colorE2E2E2.withOpacity(0.8),
                                  spreadRadius: 3,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: UiUtils.networkImages(58,58,tools.toolImage != null? ApiPath.imageBaseUrl+tools.toolImage.toString():"")
                            ),
                          );
                        })
                      ),
                    )
                  ],
                ),
              )
              :SizedBox.shrink(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 15, right: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  Languages.of(context)!.ingredient,
                  style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
                ),

                recipeModel.recipeIngredient != null &&  recipeModel.recipeIngredient!.isNotEmpty?
                ListView.builder(
                  padding: const EdgeInsets.only(top: 08),
                  itemCount:recipeModel.recipeIngredient!.length,
                  shrinkWrap: true, // Add this to fix the height issue
                  physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                  itemBuilder: (context, index) {
                    var ingredient = recipeModel.recipeIngredient![index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(height: 19, width: 20, AssetsPath.dots),
                           Expanded(
                            child: Text(
                              ingredient.name??"",
                               style:regularTextStyle(fontSize:14.0, color: MyColor.black)
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
                :SizedBox.shrink(),
              ],
            ),
          ),

          const Divider(
            color: MyColor.colorDADADA,
          ),

          recipeModel.recipeSteps != null &&    recipeModel.recipeSteps!.isNotEmpty?
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 15, right: 15, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Languages.of(context)!.howtoCook,
                  style:mediumTextStyle(fontSize:18.0, color: MyColor.black)
                ),

                ListView.builder(
                  padding: const EdgeInsets.only(top: 08),
                  itemCount: recipeModel.recipeSteps!.length,
                  shrinkWrap: true, // Add this to fix the height issue
                  physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                  itemBuilder: (context, index) {
                    var recipe =  recipeModel.recipeSteps![index];
                    return  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Step ${index+1}- ",style:semiBoldTextStyle(fontSize:14.0, color:MyColor.black),),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:1.0),
                                    child: Text(
                                      recipe.name??"",
                                      style:regularTextStyle(fontSize:14.0, color:MyColor.black)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ) : SizedBox.shrink(),


        ],
      )),

      bottomNavigationBar:Wrap(
        children: [
        recipeModel.recipeAddedBy != null?
        Container(
            padding: EdgeInsets.only(top: 10,bottom:30,left: 20,right: 20),
            decoration: BoxDecoration(
              color:widget.color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(46), topRight: Radius.circular(46)),
            ),
            alignment:
            Alignment.center, // Centers text vertically and horizontally
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child:UiUtils.networkProfile(55, 55,recipeModel.recipeAddedBy!.image != null ?"${ApiPath.imageBaseUrl}${recipeModel.recipeAddedBy!.image}":"")
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top:5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                                recipeModel.recipeAddedBy!.name ??"",
                              style:mediumTextStyle(fontSize:16.0, color: MyColor.black)
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            if (recipeModel.recipeAddedBy!.role.toString() == RegisterType.roleKids.value)
                              Text(
                             "${recipeModel.recipeAddedBy!.day ??""} | ${recipeModel.recipeAddedBy!.month ??""} | ${recipeModel.recipeAddedBy!.year ??""} | ${recipeModel.recipeAddedBy!.grade ??""}",
                             style:regularTextStyle(fontSize:14.0, color: MyColor.black)
                            )
                          else SizedBox.shrink(),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                if (recipeModel.recipeAddedBy!.id.toString() != userDetails.id.toString() && btnText(recipeModel.recipeAddedBy!.friendRequestStatus.toString()).isNotEmpty) Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: GlobalButton(btnText(recipeModel.recipeAddedBy!.friendRequestStatus.toString()), MyColor.appTheme, MyColor.appTheme, btnSize40,double.infinity, sendRequestOnTap, 55, 5, 0,mediumTextStyle(fontSize:16.0, color: MyColor.white)),
                )
                else SizedBox.fromSize()

              ],
            ),
          )
          :SizedBox.shrink(),
        ],
      ),
    );
  }
  String btnText(String status) {
    switch (status) {
      case "request not sent":
        return Languages.of(context)!.follow.toString();
      case "pending":
        return Languages.of(context)!.unFallow.toString();
        case "Accept":
        return "Accept";
        case "accepted":
        return Languages.of(context)!.friend.toString();
      case "rejected":
        return Languages.of(context)!.sendRequest.toString();
      default:
        return '';
    }
  }


  Future<void> getRecipeDetail() async {
    try {
      await ApiServices.getRecipeDetail(context, true,widget.model.id.toString()).then((onValue){
        if (mounted && onValue.status == true) {
          setState(() {
            if ( onValue.data != null) {
              recipeModel = RecipeModel.fromJson(onValue.data);
              if(recipeModel.recipeAddedBy != null){
                if(recipeModel.recipeAddedBy!.friendRequestStatus != null){
                  if(recipeModel.recipeAddedBy!.friendRequestStatus.toString() != "request not sent"){
                    isSent = true;
                  }else{
                    isSent = false;
                  }
                }
              }
            }
          });

        }
      });

    } catch (e) {
      debugPrint('Error fetching stories: $e');
    }
  }

  void sendRequestOnTap() async{
    if(recipeModel.recipeAddedBy!.friendRequestStatus.toString() == "request not sent" || recipeModel.recipeAddedBy!.friendRequestStatus.toString() == "rejected"|| recipeModel.recipeAddedBy!.friendRequestStatus.toString() == "pending" ) {
      SendFriendRequest friendRequest = SendFriendRequest(
        senderId: int.parse(userDetails.id??"0"),
        receiverId: int.parse(recipeModel.recipeAddedBy!.id.toString()),
        requestSentBy:userDetails.role ,
        requestSentTo:recipeModel.recipeAddedBy!.role.toString(),
        type: recipeModel.recipeAddedBy!.friendRequestStatus.toString() == "pending"? "cancel":""
    );
      await ApiServices.sendRequest(context, friendRequest).then((onValue){
        if(onValue.status == true){
          if(mounted){
            setState(() {
               recipeModel.recipeAddedBy!.friendRequestStatus.toString() == "pending" ?
               recipeModel.recipeAddedBy!.friendRequestStatus = "request not sent":
               recipeModel.recipeAddedBy!.friendRequestStatus = "pending";

            });
          }
        }
      });
    }

  }

}
