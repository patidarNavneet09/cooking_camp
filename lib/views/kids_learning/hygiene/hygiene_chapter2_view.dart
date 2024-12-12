import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/foodRecipeActivityView.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_activity1_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_quiz_time_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/activity_one_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/quiz_view.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:flutter/material.dart';
class HygieneChapter2View extends StatefulWidget {
  const HygieneChapter2View({super.key});

  @override
  State<HygieneChapter2View> createState() => _HygieneChapter2ViewState();
}

class _HygieneChapter2ViewState extends State<HygieneChapter2View> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top:50.0,left:20,right: 20,bottom: 5),
            child:UiUtils.hygieneAppBar(()=> Navigator.pop(context),color:MyColor.black),
          ),


          Expanded(
            child: Container(
              margin: EdgeInsets.only(top:size.size.height * 0.01,left: 20,right: 20),
              child: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("What’s hygiene?",style:boldTextStyle(fontSize:20.0, color:MyColor.green),),
                    hsized10,
                    Text("Hygiene is another word for keeping clean.",style:boldTextStyle(fontSize:17.0, color:MyColor.appTheme),),
                    hsized2,
                    Container(
                      height:2,
                      width:size.size.width* 0.8,
                      color:MyColor.appTheme,
                    ),
                    hsized10,
                    Text("If you don’t wash your hands and keep your kitchen clean bad germs can grow and make you very sick. When food makes you sick it’s called food poisoning.",style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
                    hsized8,
                    Text("Germs are everywhere!",style:boldTextStyle(fontSize:20.0, color:MyColor.appTheme),),

                    Image.asset(AssetsPath.hygieneChapter2Img),

                    hsized30,
                    UiUtils.buildFunFact(title: "Fun Fact", fact: "Not all bacteria are bad. Some bacteria are good guys and we need them to stay healthy!"),
                    hsized100

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  btnUI(String title,int index){
    return Container(
      margin: EdgeInsets.only(right:15,top:15 ),
      padding: EdgeInsets.symmetric(horizontal:30,vertical:15),
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(60)
      ),
      child: Text(title,style: mediumTextStyle(fontSize:14.0, color:MyColor.pink),),
    );
  }

}
