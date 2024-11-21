import 'dart:convert';

import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/recipe/recipe_detail_view.dart';
import 'package:cooking_champs/views/recipe/recipe_list_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

List saveCheck = [];

class _RecipeViewState extends State<RecipeView> {
  UserIdentityModel userDetails= UserIdentityModel();
  String userResponse = "";

@override
  void initState() {
  getUserData();
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
       /* appBar: AppBar(
          surfaceTintColor: MyColor.yellowF6F1E1,
          toolbarHeight: 108,
          backgroundColor: MyColor.yellowF6F1E1,
          leadingWidth: size.width * 0.80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: UiUtils.networkProfile(60, 60,userDetails.image != null? ApiPath.imageBaseUrl+userDetails.image.toString():"")
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${Languages.of(context)!.hey}, ${userDetails.name??""}",
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
              ],
            ),
          ),
          actions: [
            TouchRippleEffect(
              borderRadius: BorderRadius.circular(27),
              rippleColor: Colors.white,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image.asset(height: 42, AssetsPath.bellpng),
              ),
            )
          ],
        ),*/
      body: RecipeListView(pageType: 'dash',)
     /* SingleChildScrollView(
        child: Column(
          children: [
            RecipeListView(),
          */
      /*  Padding(
              padding: const EdgeInsets.all(5.0),
              child: ResponsiveGridRow(
                children: List.generate(10, (index) {
                  if (saveCheck.length == index) {
                    saveCheck.add(false);
                  }
                  return ResponsiveGridCol(
                      xs: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 10),
                        child: TouchRippleEffect(
                          borderRadius: BorderRadius.circular(27),
                          rippleColor: Colors.white,
                          onTap: () {},
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                color: (index % 6 == 0)
                                    ? MyColor.blueLite // First color
                                    : (index % 6 == 1)
                                        ? MyColor.colorFFFED6 // Second color
                                        : (index % 6 == 2)
                                            ? MyColor.colorE2EBFF // Third color
                                            : (index % 6 == 3)
                                                ? MyColor
                                                    .liteYellow // Fourth color
                                                : (index % 6 == 4)
                                                    ? MyColor
                                                        .colorE2FFE4 // Fifth color
                                                    : MyColor.colorFFD6D6,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TouchRippleEffect(
                                        borderRadius: BorderRadius.circular(27),
                                        rippleColor: saveCheck[index] == true
                                            ? MyColor.liteGray
                                            : Colors.red[500],
                                        onTap: () {
                                          setState(() {
                                            if (saveCheck[index] == false) {
                                              saveCheck[index] = true;
                                            } else {
                                              saveCheck[index] = false;
                                            }
                                          });

                                        },
                                        child: CircleAvatar(
                                          backgroundColor: MyColor.white,
                                          child: Image.asset(
                                            height: 15,
                                            width: size.width * 0.20,
                                            AssetsPath.savetag,
                                            color: saveCheck[index] == true ? MyColor.red : null,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Image.asset(
                                    height: 80,
                                    width: size.width * 0.30,
                                    AssetsPath.delicious),

                                hsized15,

                                 Text(
                                  "Rainbow peppers",
                                  style:semiBoldTextStyle(fontSize:15.0, color:MyColor.black)
                                ),

                               hsized5,

                                SizedBox(
                                  // color: MyColor.red,
                                  width: size.width * 0.50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        // color: MyColor.yello,
                                        width: size.width * 0.35,
                                        child:  Text(
                                          "Salad, Vegetable, Bean Breadcrumbs, Spinach  ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: regularNormalTextStyle(fontSize:12.0, color:MyColor.black)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                 Text(
                                  "More+",
                                  style:regularNormalTextStyle(fontSize:12.0, color:MyColor.black)
                                ),

                                hsized15,

                                InkWell(
                                  onTap: (){
                                    var color;
                                    setState(() {
                                      color =    (index % 6 == 0)
                                          ? MyColor.blueLite // First color
                                          : (index % 6 == 1)
                                          ? MyColor.colorFFFED6 // Second color
                                          : (index % 6 == 2)
                                          ? MyColor.colorE2EBFF // Third color
                                          : (index % 6 == 3)
                                          ? MyColor
                                          .liteYellow // Fourth color
                                          : (index % 6 == 4)
                                          ? MyColor
                                          .colorE2FFE4 // Fifth color
                                          : MyColor.colorFFD6D6;
                                    });
                                    CustomNavigators.pushNavigate(RecipeDetailView(model:RecipeModel(), color: color,), context);
                                  },

                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: MyColor.appTheme,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: MyColor.white,
                                      size: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
                }),
              ),
            )*//*
          ],
        ),
      ),*/
    );
  }
}
