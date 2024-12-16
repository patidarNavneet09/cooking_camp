import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/static_model/glossary_model.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/foodRecipeActivityView.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_activity1_view.dart';
import 'package:cooking_champs/views/kids_learning/glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_quiz_time_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_activity1_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_activity4_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_quiz_time_view.dart';
import 'package:cooking_champs/views/kids_learning/kids_learning_view.dart';
import 'package:cooking_champs/views/kids_learning/kids_recipe_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/activity_one_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/safety_kitchen_glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_activity1_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_quiz_time_view.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/sense_activity1_view.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/sense_quiz_time_view.dart';
import 'package:flutter/material.dart';
List<String> skillList = [];
class VegetableChapter1View extends StatefulWidget {
  const VegetableChapter1View({super.key});

  @override
  State<VegetableChapter1View> createState() => _VegetableChapter1ViewState();
}

class _VegetableChapter1ViewState extends State<VegetableChapter1View> {


  addSkills() {
    setState(() {
      skillList = [
        Languages.of(context)!.activities,
        Languages.of(context)!.recipes,
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
      backgroundColor: MyColor.sky,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Image.asset(
                AssetsPath.vegetablesChapter1Img
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

                    hsized5,
                    Text("My Vegetable Alphabet",style:mediumTextStyle(fontSize:17.0, color:MyColor.white),),
                    Text("Poem: Five vegetables a day you say!",style:mediumTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized15,

                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomLeft,
                      child: Wrap(
                        children: List.generate(skillList.length, (index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                CustomNavigators.pushNavigate(SenseActivity1View(), context);
                              }
                              else if(index == 1){
                                basilPestoData();
                                CustomNavigators.pushNavigate(KidsRecipeView(recipeName:"Basil Pesto", recipe: recipeModel, appBarTitle:"Activity 5.3",color:MyColor.red1,), context);
                              }
                              else if(index == 2){
                                addGlossaryList();
                                CustomNavigators.pushNavigate(GlossaryView(), context);
                              }
                              else if(index ==3){
                                CustomNavigators.pushNavigate(QuizPage(page:SenseQuizTimeView(), bgColor:MyColor.red1,btnColor: MyColor.white,btnTextColor: MyColor.red1), context);
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

  addGlossaryList(){
    setState(() {
      glossaryList = [
        GlossaryModel("Senses:", "People have five senses, the sense of sight, hearing, touch, smell, and taste. Senses work together to help us understand our world."),
      ];
    });
  }
  btnUI(String title,int index){
    return Container(
      margin: EdgeInsets.only(right:15,top:15 ),
      padding: EdgeInsets.symmetric(horizontal:30,vertical:15),
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(60)
      ),
      child: Text(title,style: mediumTextStyle(fontSize:14.0, color:MyColor.sky),),
    );
  }

}
