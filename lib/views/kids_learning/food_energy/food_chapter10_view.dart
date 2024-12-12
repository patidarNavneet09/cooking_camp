import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter10View extends StatelessWidget {
  const FoodChapter10View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),
            child: UiUtils().foodEnergyAppBar(() => Navigator.pop(context)),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiUtils.buildBoldText("DON’T FORGET WATER!",
                    fontSize: 20.0, color: MyColor.green),
                hsized15,
                UiUtils.buildBoldText(
                    "Water keeps us cool; it makes up most of our blood and helps us digest our food.",
                    color: MyColor.pink),
                hsized20,
                UiUtils.buildBoldText(
                    "We lose it when we sweat; when we breathe and... go to the toilet!",
                    color: MyColor.pink),
                hsized20,
                UiUtils.buildNormalText(
                    "To make sure our body has enough water to stay balanced we need to drink about 6 glasses a day!"),
                hsized20,
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetsPath.foodChapter10Img,
                      height: 200,
                      width: double.infinity,
                    )),
                hsized20,
                UiUtils.buildBoldText(
                    "Soooooo make WATER the DRINK you choose and don’t forget your water bottle when you go to school!",
                    color: MyColor.darkSky),

                hsized20,
                UiUtils.buildFunFact(
                  title: "Fun Fact",
                  fact:
                  "Our body is made up of about 70% water! WOW!",
                ),

                hsized100,
              ],
            ),
          ))
        ],
      ),
    );
  }
}
