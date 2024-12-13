import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/kids_recipe_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class BasicActivity5View extends StatefulWidget {
  const BasicActivity5View({super.key});

  @override
  State<BasicActivity5View> createState() => _BasicActivity5ViewState();
}

class _BasicActivity5ViewState extends State<BasicActivity5View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom:0, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(() => Navigator.pop(context),
                    color: MyColor.black, text: "Activity 4.3"),
                UiUtils.bookReadGirl(MyColor.appTheme, AssetsPath.bookReadImg)
              ],
            ),
          ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: UiUtils.buildBoldText("Recipe: Sweet Lassi", fontSize: 23.0, color:MyColor.appTheme),
        ),

          Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal:3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                hsized20,
                Image.asset(AssetsPath.punjabSweetLassi),

                hsized50,

              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.only(left:20.0,right:20,bottom:50),
        child: GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                (){
              setState(() {
                fruitCupsData();
              });
              CustomNavigators.pushNavigate(KidsRecipeView(recipeName: "Jelly Fruit cups", recipe:recipeModel, appBarTitle:"Activity 4.5",color:MyColor.purple,),context);
            },
            55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)),
      ),
    );
  }
}
