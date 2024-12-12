import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_activity4a_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class FoodActivity4View extends StatelessWidget {
  const FoodActivity4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils().foodEnergyAppBar(() => Navigator.pop(context),
                    text: "Activity 2.4"),
                UiUtils.bookReadGirl(MyColor.pink,AssetsPath.bookReadImg)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        UiUtils.buildBoldText("Make Invisible Plaque Visible", fontSize: 23.0, color: MyColor.pink),

                        hsized5,
                        UiUtils.buildSemiBoldText(
                          "This experiment works better if you haven’t brushed your teeth first.",
                          color: MyColor.black,
                        ),

                        hsized20,
                        UiUtils.buildBoldText("You need:", fontSize: 18.0, color: MyColor.darkSky),

                        hsized10,
                        UiUtils.buildBulletPoints([
                          "Green or blue food colouring.",
                          "Paper cups (2 per person).",
                          "Mirror.",
                          "Toothbrush and toothpaste.",
                          "Water.",
                        ]),

                        hsized20,
                        UiUtils.buildBoldText("What you have to do:", fontSize: 18.0, color: MyColor.darkSky),

                        hsized10,
                        UiUtils.buildNormalText(
                            "Combine three or four drops of the food colouring with a few tablespoons of water in a paper cup.",
                            fontSize: 16.0,
                            color: MyColor.black),
                        hsized8,
                        UiUtils.buildNormalText(
                            "Swish the coloured water around in your mouth for about ten seconds and then carefully spit it out into another cup or a nearby sink.",
                            fontSize: 16.0,
                            color: MyColor.black),
                        hsized8,
                        UiUtils.buildNormalText(
                            "Then look in a mirror and look at the green areas which show where the plaque is.",
                            fontSize: 16.0,
                            color: MyColor.black),
                        hsized8,
                        UiUtils.buildNormalText(
                            "Brush your teeth with toothpaste and repeat swishing with the coloured water.",
                            fontSize: 16.0,
                            color: MyColor.black),


                        hsized20,
                        UiUtils.buildBoldText("See how much of the plaque is gone:", fontSize: 18.0, color: MyColor.darkSky),

                        hsized10,
                        UiUtils.buildBulletPoints([
                          "In which areas is the plaque hiding?",
                          "What spots have been missed during the brushing process?",
                          "Which spots in your mouth need more attention during brushing?",
                        ],bottomPadding:5.0),

                        hsized10,
                        UiUtils.buildNormalText(
                          "Since plaque is invisible, it can be hard even for adults to ensure that each tooth gets completely clean during a brushing session. This exercise tells you where you need to brush.",
                        ),

                        hsized20,
                        UiUtils.buildFunFact(title:"Fun Fact", fact:"Energy drinks have 11% more sugar than regular soft drinks! Wow!"),

                        hsized20,
                      ],
                    ),
                  ),
                  hsized20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                        ()=>  CustomNavigators.pushNavigate(FoodActivity4AView(), context),
                        55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)),
                  ),
                  hsized50,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
