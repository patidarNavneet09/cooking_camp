import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/activity_one_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/quiz_view.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:flutter/material.dart';
List<String> skillList = [];
class FoodEnergyChapter1View extends StatefulWidget {
  const FoodEnergyChapter1View({super.key});

  @override
  State<FoodEnergyChapter1View> createState() => _FoodEnergyChapter1ViewState();
}

class _FoodEnergyChapter1ViewState extends State<FoodEnergyChapter1View> {


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
      backgroundColor: MyColor.pink,
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top:50.0,left:20,right: 20,bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  radius: 80,
                  onTap: (){
                    setState(() {
                      currentIndex = 0;
                    });
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,size:28,),
                ),
                SizedBox(width:10),
                Text("Food is energy",style:mediumTextStyle(fontSize:18.0, color:MyColor.black),),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Image.asset(
                AssetsPath.foodEnergyImg1
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
                    Text("The trail mix story",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized8,
                    Text("Digestion",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized8,
                    Text("Rhyming Rules to stop decay",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                    hsized8,
                    Text("A healthy diet: eat a rainbow",style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),

                    hsized15,
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomLeft,
                      child: Wrap(
                        children: List.generate(skillList.length, (index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                CustomNavigators.pushNavigate(ActivityOneView(), context);
                              }
                              else if (index == 1) {
                                CustomNavigators.pushNavigate(GlossaryView(), context);
                                // setState(() {
                                //   currentIndex = 11;
                                // });
                                // _pageController.jumpToPage(currentIndex); // for regular jump
                              }else if(index == 2){
                                CustomNavigators.pushNavigate(QuizPage(), context);
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
