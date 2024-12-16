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
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/activity_one_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/safety_kitchen_glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_activity1_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_quiz_time_view.dart';
import 'package:flutter/material.dart';
List<String> skillList = [];
class SenseChapter1View extends StatefulWidget {
  const SenseChapter1View({super.key});

  @override
  State<SenseChapter1View> createState() => _SenseChapter1ViewState();
}

class _SenseChapter1ViewState extends State<SenseChapter1View> {


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
      backgroundColor: MyColor.red1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Image.asset(
                AssetsPath.senseChapter1Img
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
                    Text("What’s inside",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized8,
                    Text("Our Senses",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized15,

                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomLeft,
                      child: Wrap(
                        children: List.generate(skillList.length, (index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                CustomNavigators.pushNavigate(BasicActivity1View(), context);
                              }
                              else if(index == 1){
                                addGlossaryList();
                                CustomNavigators.pushNavigate(GlossaryView(), context);
                              }else if(index ==2){
                                CustomNavigators.pushNavigate(QuizPage(page:BasicQuizTimeView(), bgColor:MyColor.red1,btnColor: MyColor.white,btnTextColor: MyColor.red1), context);
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
        GlossaryModel("Beat", "To stir fast to make a mixture smooth, using a whisk, spoon, or mixer"),
        GlossaryModel("Blend", "To thoroughly combine 2 or more ingredients, either by hand with a whisk or spoon, or with a mixer"),
        GlossaryModel("Boiling", "Heating liquid over high heat until it is bubbling a lot "),
        GlossaryModel("Chop", "Cut into small even pieces"),
        GlossaryModel("Core", "To cut out the seeds and central core from fruit and vegetables"),
        GlossaryModel("Dissolve", " When a solid ingredient like sugar or salt melt in liquid"),
        GlossaryModel("Garnish", "To decorate a meal plate with herbs or vegetables or salad"),
        GlossaryModel("Simmer", "The opposite of boiling gently heating the liquid over a low flame usually you have small bubbles."),
        GlossaryModel("Whisk", "Beat mixture with a whisk to lighten with air."),
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
      child: Text(title,style: mediumTextStyle(fontSize:14.0, color:MyColor.red1),),
    );
  }

}
