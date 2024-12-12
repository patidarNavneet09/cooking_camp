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
List<String> skillList = [];
class HygieneChapter1View extends StatefulWidget {
  const HygieneChapter1View({super.key});

  @override
  State<HygieneChapter1View> createState() => _HygieneChapter1ViewState();
}

class _HygieneChapter1ViewState extends State<HygieneChapter1View> {


  addSkills() {
    setState(() {
      skillList = [
        Languages.of(context)!.activities,
        Languages.of(context)!.glossary,
        Languages.of(context)!.quizTime
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    addSkills();
    final size = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: MyColor.green,
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top:50.0,left:20,right: 20,bottom: 20),
            child:UiUtils.hygieneAppBar(()=> Navigator.pop(context)),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Image.asset(
                AssetsPath.hygieneChapter1Img
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(top:size.size.height * 0.01,left: 20,right: 20),
              child: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Languages.of(context)!.whatInside,style:semiBoldTextStyle(fontSize:20.0, color:MyColor.white),),
                    hsized8,
                    Text("What is Hygiene?",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized8,
                    Text("What is Food Poisoning?",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized8,
                    Text("What is Food Poisoning?",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized8,
                    Text("Wash hands clean chart",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),

                    hsized8,
                    Text("Cooking Champs Hand Washing song",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),

                    hsized8,
                    Text("Cooking Champs Hand Washing song",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),

                    hsized15,
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomLeft,
                      child: Wrap(
                        children: List.generate(skillList.length, (index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                CustomNavigators.pushNavigate(FoodActivity1View(), context);
                              }
                              else if (index == 1) {
                                CustomNavigators.pushNavigate(FoodRecipeView(recipeName: 'Trail Mix',), context);
                              }else if(index == 2){
                                CustomNavigators.pushNavigate(FoodGlossaryView(), context);
                              }else if(index ==3){
                                CustomNavigators.pushNavigate(QuizPage(page:FoodQuizTimeView(), bgColor:MyColor.green), context);
                              }
                            },
                            child: btnUI(skillList[index], index),
                          );
                        }),
                      ),
                    ),
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
