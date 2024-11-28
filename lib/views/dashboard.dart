import 'dart:convert';
import 'dart:io';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/notification_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/aboutUs/aboutus_view.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/views/menu/menu_view.dart';
import 'package:cooking_champs/views/home.dart';
import 'package:cooking_champs/views/kitslearning.dart';
import 'package:cooking_champs/views/notication_view.dart';
import 'package:cooking_champs/views/story/memories_view.dart';
import 'package:cooking_champs/views/recipe/recipe.dart';
import 'package:cooking_champs/views/save_view.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class DashBoardView extends StatefulWidget {
  final int? pageIndex;
  // final String? tabCheck;

  const DashBoardView({super.key, this.pageIndex,
    // this.tabCheck
  });

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

bool? isTabExplore = false;
int pageIndex = 0;
String? tabCheck;

class _DashBoardViewState extends State<DashBoardView> {
  bool? isLogin = false;

  UserIdentityModel userDetails= UserIdentityModel();
  String userResponse = "";
  bool isBusy  = false;
  // pages count & variable assign >>>>>>>>>

  var pages = [
    const HomeView(),
    const RecipeView(),
    const SaveView(),
  ];


  @override
  void initState() {
    super.initState();
    NotificationService().initialize(); // Initialize the notification service

    if (widget.pageIndex != null) {
        pageIndex = widget.pageIndex!;
      }
    Future.delayed(Duration.zero,getProfileDetail);
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
    getUserData();
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        bottomNavigationBar:isBusy?SizedBox.shrink(): buildMyNavBar(context),
          body: Column(
          children: [
           // pageIndex == 3 || widget.tabCheck == "kids" ||  widget.tabCheck == "OurStories" ||  widget.tabCheck == "Aboutus"? SizedBox.shrink():
            pageIndex == 3 || tabCheck == "kids" ||  tabCheck == "OurStories" ||  tabCheck == "Aboutus"? SizedBox.shrink():
            Container(
              padding: EdgeInsets.only(left: 20,right:20,top:45,bottom: 20),
              decoration: BoxDecoration(
                color: MyColor.yellowF6F1E1
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: UiUtils.networkProfile(60, 60,userDetails.image != null? ApiPath.imageBaseUrl+userDetails.image.toString():"")
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top:0, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${Languages.of(context)!.hey}, ${userDetails.name??""}",
                                    maxLines: 2,
                                    style:semiBoldTextStyle(fontSize:18.0, color:MyColor.appTheme)
                                ),
                                Text(
                                    Languages.of(context)!.welcomeBack,
                                    style: regularTextStyle(fontSize: 16.0, color: MyColor.black)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  ),
                  TouchRippleEffect(
                    borderRadius: BorderRadius.circular(27),
                    rippleColor: Colors.white,
                    onTap: () {
                      CustomNavigators.pushNavigate(NotificationView(), context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Image.asset(height: 42, AssetsPath.bellpng),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: _getPage()
              // isTabExplore == true
              //   ? widget.tabCheck == "kids"
              //   ? const KidsLearningView()
              //   : widget.tabCheck == "OurStories"
              //   ? const OurStoriesView()
              //   : widget.tabCheck == "Aboutus"
              //   ? const AboutUsView()
              //   :  pages[pageIndex]
              //   : pageIndex == 3
              //    ? pages[2]
              //    : pages[pageIndex],
            )
          ],
        )


      ),
    );
  }
  Widget _getPage() {
    if (isTabExplore!) {
      switch (tabCheck) {
        case "kids":
          return const KidsLearningView();
        case "OurStories":
          return const MemoriesView();
        case "Aboutus":
          return const AboutUsView();
        default:
          return pages[pageIndex];
      }
    } else {
      return pageIndex == 3 ? pages[2] : pages[pageIndex];
    }
  }


  Container buildMyNavBar(BuildContext context) {
    return Container(
      height:Platform.isAndroid? 75: 80,
      decoration: const BoxDecoration(
        color: MyColor.liteYellowBottom,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 5.0,bottom:Platform.isAndroid? 10:12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                menuItem(Languages.of(context)!.home,  AssetsPath.homepng, onTapTab1,0),
                menuItem(Languages.of(context)!.recipe,  AssetsPath.recipepng, onTapTab1,1),
                menuItem(Languages.of(context)!.save,  AssetsPath.savepng, onTapTab1,2),
                menuItem(Languages.of(context)!.menu,  AssetsPath.menu, onTapTab1,3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  menuItem(String title,String img,GestureTapCallback onTap,int index){
    return  Row(
      children: [
        InkWell(
          radius: 50,
          customBorder: const CircleBorder(),
          onTap: () {
            if(index == 3){
              AllDialogs.globalBottomSheet(context, MenuView(),(){});
            }else{
              setState(() {
                pageIndex = index;
                isTabExplore = false;
                tabCheck = "";
              });
            }
          },
          child: SizedBox(
            height: 60,
            width: 60,
            child: Column(
              children: [
                SizedBox(
                    height: pageIndex == index ? 30 : 30,
                    width: 25,
                    child: Image.asset(
                      img,
                      color: pageIndex == index
                          ? null
                          : MyColor.bottomIconColor,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                    style: semiBoldTextStyle(
                        fontSize: 12.0,
                        color: pageIndex == index
                            ? MyColor.appTheme
                            : MyColor.bottomIconColor))
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onTapTab1() {
    setState(() {
      pageIndex = 0;
      isTabExplore = false;
      tabCheck = "";
    });
  }

  getProfileDetail()async{
    if(!isBusy){
      if(mounted){
        setState(() {
          isBusy = true;
        });
      }
      await ApiServices.userDetail(context,"",false).then((onValue){
        if(mounted){
          setState(() {
            if(onValue.status == true){
              if(onValue.data != null){
                userDetails = UserIdentityModel.fromJson(onValue.data);
                if(userDetails.firstName != null){
                  getUserData();
                }
              }
            }
          });
        }
      });

      if(mounted){
        setState(() {
          isBusy = false;
        });
      }
    }
  }
}
