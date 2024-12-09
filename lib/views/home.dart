import 'dart:convert';

import 'package:cooking_champs/constant/app_state.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/home_model.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/recipe/recipe_detail_view.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/story/all_story_view.dart';
import 'package:cooking_champs/views/story/storie_detials.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserIdentityModel userDetails= UserIdentityModel();
  HomeModel homeModel = HomeModel();
  List<RecipeModel> recipeOfTheWeekList = [];
  List<RecipeModel> popularRecipeList = [];
  List<StoryModel> featuredStoryList = [];
  String userResponse = "";
  List exploreList = [
    "Kids Learning",
    "Our Stories",
    "About Us",
  ];

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async{
    Future.delayed(Duration.zero,(){
    home(true);
    });

    var data = await PreferencesServices.getPreferencesData(PreferencesServices.loginUserIdentityDetails);
    if(data != null){
      Map<String, dynamic> jsonResponse = await jsonDecode(data);
      userDetails = UserIdentityModel.fromJson(jsonResponse);
    }
    if(mounted){
      setState(() {});
    }
  }
void home(bool load) async{
   await ApiServices.home(context, load).then((onValue){
     if(mounted){
       if(onValue.status == true){
         setState(() {
           if(onValue.data != null){
             homeModel = HomeModel.fromJson(onValue.data);
             if(homeModel.recipeOfTheWeek != null){
               recipeOfTheWeekList.add(homeModel.recipeOfTheWeek!);
             }

             if(homeModel.popularRecipes!.isNotEmpty){
               popularRecipeList.addAll(homeModel.popularRecipes!);
             }
             for (int i = 0; i < popularRecipeList.length; i++) {
               popularRecipeList[i].color = Utility().getColorForIndex(i);
             }

             if(homeModel.featuredStories!.isNotEmpty){
               featuredStoryList.addAll(homeModel.featuredStories!);
             }
           }
         });
       }
     }
   });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            hsized10,
            Container(
               height: 115,
               width: size.width,
              padding: const EdgeInsets.only(left:10,right:10),

              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  exploreUi(0),
                  exploreUi(1),
                  exploreUi(2),
                ]
              )
            ),

            recipeOfTheWeekList.isEmpty?
                SizedBox.shrink():
            SizedBox(
              height: 170,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipeOfTheWeekList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return bannerUi(size,recipeOfTheWeekList[index]);
                  }),
            ),

            hsized15,

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Languages.of(context)!.popularRecipe,
                        overflow: TextOverflow.ellipsis,
                        style:mediumTextStyle(fontSize:18.0, color:  MyColor.black)
                      ),
                      InkWell(
                        radius: 50,
                        onTap: () {
                          setState(() {
                            isTabExplore = false;
                            pageIndex = 1;
                          });
                        },
                        child: Text(
                          Languages.of(context)!.seeall,
                          overflow: TextOverflow.ellipsis,
                          style:mediumTextStyle(fontSize:15.0, color:  MyColor.appTheme)
                        ),
                      ),
                    ],
                  ),

                 hsized10,

                  popularRecipeList.isNotEmpty?
                  Container(
                    height: 300,
                    margin: const EdgeInsets.only(bottom: 0),
                    alignment: Alignment.center,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: popularRecipeList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var model = popularRecipeList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5, top: 10,right: 10),
                            child: TouchRippleEffect(
                              borderRadius: BorderRadius.circular(30),
                              rippleColor: Colors.white,
                              onTap: () {
                                CustomNavigators.pushNavigate(RecipeDetailView( model:model, color:model.color??MyColor.blueLite), context);
                              },
                              child: Container(
                                height: 290,
                                width: size.width * 0.46,
                                decoration: BoxDecoration(
                                    color:model.color??MyColor.blueLite,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                   hsized30,

                                    UiUtils.networkImages( size.width * 0.30,80,"${ApiPath.imageBaseUrl}${model.bannerImage ?? ""}"),

                                   hsized15,

                                     Text(
                                         model.name??"",
                                      style:semiBoldTextStyle(fontSize:15.0, color:MyColor.black)
                                    ),

                                    hsized5,

                                    model.recipeIngredient != null?
                                    SizedBox(
                                        width: size.width * 0.35,
                                        child:  ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount:model.recipeIngredient!.length > 1 ?1:model.recipeIngredient!.length ,
                                          itemBuilder: (context,int index){
                                            return Text(
                                                model.recipeIngredient![index].name??"",
                                                maxLines:2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style:regularNormalTextStyle(fontSize:12.0, color:MyColor.black)
                                            );
                                          },)
                                    )
                                        : SizedBox.shrink(),
                                    const Text(
                                      "More+",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: Fonts.beVietnamProRegular,
                                        color: MyColor.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: MyColor.appTheme,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: MyColor.white,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                      :SizedBox.shrink(),

                 hsized15,

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Languages.of(context)!.featuredstories,
                          overflow: TextOverflow.ellipsis,
                          style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
                        ),
                        InkWell(
                          onTap: (){
                            CustomNavigators.pushNavigate(AllStoryView(), context);
                          },
                          child: Text(
                            Languages.of(context)!.seeall,
                            overflow: TextOverflow.ellipsis,
                            style:regularTextStyle(fontSize:15.0, color:MyColor.appTheme)
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  featuredStoryList.isNotEmpty?
                  Container(
                    height: 250,
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount:featuredStoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 10),
                            child: TouchRippleEffect(
                              borderRadius: BorderRadius.circular(10),
                              rippleColor: Colors.white,
                              onTap: () {
                                CustomNavigators.pushNavigate(StoriesDetailsView(model:featuredStoryList[index], type: '',), context);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: MyColor.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                width: size.width * 0.46,
                                height: 250,
                                child: Column(
                                  children: [
                                    UiUtils.networkImages( size.width * 0.52,  size.height * 0.14,"${ApiPath.imageBaseUrl}${featuredStoryList[index].image.toString()}",),

                                   hsized10,
                                     Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              featuredStoryList[index].title??"",
                                            maxLines: 1,
                                            style:mediumTextStyle(fontSize:15.0, color:MyColor.black,overflow:TextOverflow.ellipsis)
                                          ),
                                          hsized5,
                                          Text(
                                              featuredStoryList[index].description??"",
                                            maxLines: 2,
                                            style:regularTextStyle(fontSize: 11.0, color:MyColor.black,overflow:TextOverflow.ellipsis)
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                  :SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  exploreUi(int index){
    return  Expanded(
      flex:2,
      child: InkWell(
        onTap: (){
          setState(() {
          tabCheck=  index == 0 ? "kids" : index == 1 ? "OurStories" : index == 2 ? "Aboutus" : "";
          pageIndex =0;
          });
       //   CustomNavigators.pushReplacementNavigate(DashBoardView(pageIndex:0, tabCheck: index == 0 ? "kids" : index == 1 ? "OurStories" : index == 2 ? "Aboutus" : "",), context);
          setState(() {
            isTabExplore = true;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right:index == 2?5:10,left:5),
          padding: EdgeInsets.only(right:10,left:10,top: 5,bottom:10),
          decoration: BoxDecoration(
              color:index == 0
          ? MyColor.colorFFF0FF8
              : index == 1
              ? MyColor.colorEDEFFF
              : MyColor.colorF3E6FF,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hsized10,
              Image.asset(
                index == 0
                    ? AssetsPath.kitslearningorange
                    : index == 1
                    ? AssetsPath.ourstoriesblue
                    : AssetsPath.aboutsblue,
                width: 36,
                height: 36,
              ),

              hsized10,
              Text(
                  exploreList[index],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:semiBoldTextStyle(fontSize:14.0, color:index == 0
                      ? MyColor.orange
                      : index == 1
                      ? MyColor.blue1
                      : MyColor.appTheme)
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bannerUi(var size,RecipeModel model) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 11.0, bottom: 0.0, left: 15.0, right: 15.0),
      child: TouchRippleEffect(
        borderRadius: BorderRadius.circular(27),
        rippleColor: Colors.white,
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
              color: MyColor.colorE0FFC6,
              borderRadius:
              BorderRadius.all(Radius.circular(24))),
          height: 165,
          width: size.width * 0.94,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 165,
                    width: size.width * 0.60,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         hsized45,
                          Text(
                              model.name??"",
                              overflow: TextOverflow.ellipsis,
                              style: semiBoldTextStyle(fontSize:17.0, color:  MyColor.black)

                          ),
                         hsized2,
                          model.recipeIngredient != null?
                          SizedBox(
                              width: size.width * 0.35,
                              child:  ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:model.recipeIngredient!.length > 1 ?1:model.recipeIngredient!.length ,
                                itemBuilder: (context,int index){
                                  return Text(
                                      model.recipeIngredient![index].name??"",
                                      maxLines:2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style:regularNormalTextStyle(fontSize:12.0, color:MyColor.black)
                                  );
                                },)
                          )
                              : SizedBox.shrink(),
                         hsized15,

                          GlobalButton(Languages.of(context)!.viewDetailsarrow.toString(),MyColor.appTheme,MyColor.appTheme,30.0, size.width * 0.27,(){
                            CustomNavigators.pushNavigate(RecipeDetailView( model:model, color:model.color??MyColor.colorE0FFC6), context);
                          },10,5,0,regularTextStyle(fontSize:13.0, color:  MyColor.white))
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(27)),
                          child:UiUtils.networkImages(size.width * 0.30,120,"${ApiPath.imageBaseUrl}${model.bannerImage}")
                      ),
                    ],
                  )
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    color: MyColor.yellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(27),
                        bottomRight: Radius.circular(27))),
                height: 41,
                width: size.width * 0.50,
                child: Padding(
                  padding: EdgeInsets.only(left: 21, top: 10),
                  child: Text(
                      "Recipe of the Week",
                      style:regularTextStyle(fontSize:16.0, color:  MyColor.black)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void viewDetailsOnTap() {
  }


}
