import 'dart:convert';

import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/enums/register_enum.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/authentication/change_password_view.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/friend_request.dart';
import 'package:cooking_champs/views/helpsupport.dart';
import 'package:cooking_champs/views/my_kids_listing_view.dart';
import 'package:cooking_champs/views/my_kids_profile_view.dart';
import 'package:cooking_champs/views/story/memories_view.dart';
import 'package:cooking_champs/views/profile/editprofile.dart';
import 'package:cooking_champs/widgets/delete_account_popup.dart';
import 'package:cooking_champs/widgets/logout_popup.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  UserIdentityModel userDetails= UserIdentityModel();
  String friendRequestCount = "0";

  @override
  void initState() {
Future.delayed(Duration.zero,(){callApi(context);});
    getUserData();
    super.initState();
  }

  void getUserData() async{
    var data = await PreferencesServices.getPreferencesData(PreferencesServices.loginUserIdentityDetails);
    if(data != null){
      Map<String, dynamic> jsonResponse = await jsonDecode(data);
      if(mounted){
        setState(() {
          userDetails = UserIdentityModel.fromJson(jsonResponse);
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    countFriendRequestApi();
    final data = MediaQuery.of(context);
    final size = data.size;
    return  MediaQuery(data: data.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Wrap(
            children: [
              Container(
                color: MyColor.white,
                alignment: Alignment.bottomCenter,
               // height: size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                    hsized10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height:5,
                            decoration: const BoxDecoration(
                                color: MyColor.liteGrayB5B5B5,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                          ),
                        ],
                      ),


                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top:15, bottom: 15, left: 20, right: 20),
                            width: size.width,
                            height: 90,
                            decoration: const BoxDecoration(
                                color: MyColor.yellowF6F1E1,
                                borderRadius: BorderRadius.all(Radius.circular(16))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: ClipRRect(
                                         borderRadius: BorderRadius.circular(500),
                                          child: UiUtils.networkProfile(60, 60,userDetails.image != null?ApiPath.imageBaseUrl+ userDetails.image.toString():""),
                                        ),
                                      ),

                                       Expanded(
                                        child: Text(
                                            userDetails.name??"",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: mediumTextStyle(fontSize:17.0, color:MyColor.black)
                                        ),
                                      ),

                                       SizedBox(width: 15,),
                                       SizedBox(
                                        width: size.width * 0.25,
                                        height: 37,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: MyColor.appTheme,
                                                overlayColor: MyColor.liteOrange,
                                                enableFeedback: true,
                                                enabledMouseCursor: MouseCursor.defer,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      10), // Custom shape
                                                ),
                                                padding: EdgeInsets.zero),
                                            onPressed: () {
                                              AllDialogs.customDialog(context, LogoutPopup());

                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 12, right: 10),
                                                  child: Image.asset(
                                                      height: 20,
                                                      width: 20,
                                                      AssetsPath.logout),
                                                ),

                                                Text(
                                                  Languages.of(context)!.logout.toString(),
                                                  style: mediumTextStyle(fontSize:13.0, color: MyColor.white)
                                                ),

                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Languages.of(context)!.explore.toString(),
                                  style:
                                  regularTextStyle(fontSize: 13.0, color: MyColor.black)

                                ),

                                hsized10,

                                itemCard(size, Languages.of(context)!.kidLearning.toString(), AssetsPath.person,1,kidLearningOnTap),
                                itemCard(size, Languages.of(context)!.ourStories.toString(), AssetsPath.overstories,2,ourStoriesOnTap),
                                userDetails.role == RegisterType.roleKids.value?SizedBox.shrink():
                                itemCard(size, Languages.of(context)!.myKids.toString(), AssetsPath.kitslearningorange,3,myKidsOnTap),
                                itemCard(size, Languages.of(context)!.friendRequest.toString(), AssetsPath.addPerson,4,friendRequestOnTap),
                                itemCard(size, Languages.of(context)!.aboutUs.toString(), AssetsPath.aboutus,5,aboutOnTap),


                              ],
                            ),
                          ),


                          const Divider(
                            color: MyColor.colorDADADA,
                          ),


                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  Languages.of(context)!.support.toString(),
                                  style: regularTextStyle(fontSize:13.0, color:MyColor.black)
                                ),

                               hsized10,

                                userDetails.role == RegisterType.roleKids.value?
                                itemCard(size, Languages.of(context)!.helpSupport.toString(), AssetsPath.help,8,helpSupportOnTap):
                                Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        itemCard(size, Languages.of(context)!.editProfile.toString(), AssetsPath.editprofile,6,editProfileOnTap),
                                        itemCard(size, Languages.of(context)!.changePassword.toString(), AssetsPath.changepassword,7,changePassOnTap),
                                        itemCard(size, Languages.of(context)!.helpSupport.toString(), AssetsPath.help,8,helpSupportOnTap),
                                        itemCard(size, Languages.of(context)!.deleteAccount.toString(), AssetsPath.delete,9,deleteAccountOnTap),

                                      ],
                                    )

                              ],
                            ),
                          ),
                        ],
                      ),


                      SizedBox(
                        height: size.height * 0.04,
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  itemCard(var size,String title,String img,int id,GestureTapCallback onTap){
    return   ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: size.width * 0.80,
      splashColor: MyColor.appTheme.withOpacity(0.2),
      minTileHeight: 40,
      onTap: onTap,
      leading: SizedBox(
        width: size.width * 0.80,
        // Adjust this value as per your layout needs
        child: Row(
          children: [
            Image.asset(
              height: 23,
              width: 23,
              img,
              color: id == 9 ?MyColor.red :MyColor.appTheme,
            ),

            const SizedBox(width: 10),

            Flexible(
              child: Text(
                  title,
                  style: regularTextStyle(fontSize:13.0, color: id == 9 ?MyColor.red :MyColor.black)
              ),
            ),
          ],
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            id == 4?    Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColor.appTheme,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  friendRequestCount,
                  style: TextStyle(color: MyColor.white),
                ),
              ),
            ):SizedBox.shrink(),

            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: id == 9 ?MyColor.red :Colors.black,
            ),
          ],
        ),
      ),

    );
  }



  void kidLearningOnTap() {
    setState(() {
      isTabExplore = true;
      pageIndex = 3;
      tabCheck = "kids";
    });
    Navigator.pop(context);
    // CustomNavigators.pushRemoveUntil(const DashBoardView(
    //   pageIndex: 3,
    //   tabCheck: "kids",
    // ), context);
  }

  void friendRequestOnTap() {
    setState(() {
      isTabExplore = true;
    });
    CustomNavigators.pushNavigate(FriendRequestView(type: 'menu',), context);
  }


  void ourStoriesOnTap() {
    Navigator.pop(context);
    setState(() {
      isTabExplore = true;
      pageIndex = 3;
      tabCheck = "OurStories";
    });
  //  CustomNavigators.pushNavigate(MemoriesView(onCallBack:onUpdate), context);
  }

  void myKidsOnTap() {
    setState(() {
      isTabExplore = true;
    });
    CustomNavigators.pushNavigate(const MyKidsListingView(pageType: 'MyKids'), context);
  }

  void aboutOnTap() {
    Navigator.pop(context);
    setState(() {
      isTabExplore = true;
      pageIndex = 3;
      tabCheck = "Aboutus";
    });
  }



  void editProfileOnTap() {
    CustomNavigators.pushNavigate(EditProfileView(onUpdate: onUpdate,), context);
  }

  void changePassOnTap() {
    CustomNavigators.pushNavigate(ChangePasswordView(), context);
  }

  void helpSupportOnTap() {
    CustomNavigators.pushNavigate(HelpSupportView(), context);
  }

  void deleteAccountOnTap() {
    AllDialogs.customDialog(context, DeleteAccountPopup(onCallBack: onDeleteAccount));
  }


  onDeleteAccount() async{
    await ApiServices.deleteAccount(context).then((onValue){
      if(mounted){
        if(onValue.status == true){
         PreferencesServices.setLogoutPreferencesData();
         CustomNavigators.pushRemoveUntil(LoginView(),context);
        }
      }
    });
  }


  onUpdate() {
    Future.delayed(Duration.zero,getProfileDetail);
  }
  getProfileDetail()async{
    await ApiServices.userDetail(context,"",false).then((onValue){
      if(mounted){
        setState(() {
          if(onValue.status == true){
            if(onValue.data != null){
              userDetails = UserIdentityModel.fromJson(onValue.data);
              if(userDetails.firstName != null){
               PreferencesServices.setPreferencesData(PreferencesServices.loginUserIdentityDetails, userDetails.toJson());
              }
            }
          }
        });
      }
    });
  }

  void countFriendRequestApi() {
    Future.delayed(const Duration(minutes:1), (){
      // call API functionality
    //  callApi(context);
    });
  }
  callApi(BuildContext context)async{
    await ApiServices.countFriendRequest(context,false).then((onValue){
      if(mounted){
        setState(() {
          if(onValue.status == true) {
            friendRequestCount = onValue.pendingReqCount??"";
            //"1";
          }
        });
      }

    });

  }

}
