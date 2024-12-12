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

class HygieneChapter3View extends StatefulWidget {
  const HygieneChapter3View({super.key});

  @override
  State<HygieneChapter3View> createState() => _HygieneChapter3ViewState();
}

class _HygieneChapter3ViewState extends State<HygieneChapter3View> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, left: 20, right: 20, bottom:20),
              child: UiUtils.hygieneAppBar(() => Navigator.pop(context),
                  color: MyColor.black)),
         /* Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, left: 20, right: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiUtils.hygieneAppBar(() => Navigator.pop(context),
                      color: MyColor.black),
                  UiUtils.bookReadGirl(MyColor.green, AssetsPath.bookReadImg)
                ],
              )),*/
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: size.size.height * 0.01,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiUtils.buildBoldText("What is food poisoning?",
                              fontSize: 20.0, color: MyColor.green),
                          hsized10,
                          UiUtils.buildNormalText(
                              "Sometimes there can be germs in our food. When we eat this food it gets into our tummies and makes us sick. That is called food poisoning.",
                              fontSize: 16.0,
                              color: MyColor.black),
                        ],
                      ),
                    ),

                    hsized20,
                    Image.asset(AssetsPath.hygieneChapter3Img),
                    hsized20,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiUtils.buildNormalText(
                              "Germs are so small that you need a microscope to see them. But they are there! The problem is germs are shifty; they can hide just about anywhere.",
                              fontSize: 16.0,
                              color: MyColor.black),
                          hsized20,
                          UiUtils.buildBoldText("Immune System",
                              fontSize: 18.0),
                          hsized5,
                          UiUtils.buildNormalText(
                              "Our immune system protects us from germs. It’s like an army that is always ready to fight invaders! The first job of the immune system is to keep germs out. This is the work of our Saliva, tears and skin",
                              fontSize: 16.0,
                              color: MyColor.black),
                          hsized10,
                          UiUtils.buildBoldText("If they do sneak in through:",
                              fontSize: 18.0),
                          hsized5,

                          UiUtils.buildParagraph(
                              "Our mouth from food we eat or things we touch or Cuts on our skin ",
                              "Special organs and cells inside our body work hard to destroy them but it’s safer to keep them out! ",
                              "THAT’S WHY Hygiene is very important because… It helps keep germs out of our body.",
                              regularFontSize: 16.0,
                              highlightFontSize: 16.0,
                              color: MyColor.pink),
                        ],
                      ),
                    ),
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

  btnUI(String title, int index) {
    return Container(
      margin: EdgeInsets.only(right: 15, top: 15),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
          color: MyColor.white, borderRadius: BorderRadius.circular(60)),
      child: Text(
        title,
        style: mediumTextStyle(fontSize: 14.0, color: MyColor.pink),
      ),
    );
  }
}
