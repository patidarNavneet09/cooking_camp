import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BasicChapter4View extends StatelessWidget {
  const BasicChapter4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiUtils.buildBoldText("Measuring in the kitchen",
              color: MyColor.purple, fontSize: 20.0),
          hsized5,
          UiUtils.buildNormalText(
              "Sometimes when we cook we need to put exact amounts of different ingredients so we need measuring tools.",
              color: MyColor.purple,
              fontSize: 16.0),
          
          hsized20,
          
          Image.asset(AssetsPath.basicChapter4Img),

          hsized20,
          UiUtils.buildBoldText("Measurement is easy when you know how.", color: MyColor.green, fontSize:16.0),
          UiUtils.buildMediumText("When we measure liquids like water and milk we use litres", color: MyColor.black, fontSize:16.0),
          hsized2,
          UiUtils.buildNormalText("1 litre = 1,000 millilitres", color: MyColor.black, fontSize:16.0),
          hsized10,
          UiUtils.buildMediumText("When we measure solids like flour and rice we use grams", color: MyColor.black, fontSize:16.0),
          hsized2,
          UiUtils.buildNormalText("1 kilogram = 1,000 grams", color: MyColor.black, fontSize:16.0),

          hsized10,
          UiUtils.buildMediumText("When we measure heat we use Fahrenheit or Celsius", color: MyColor.black, fontSize:16.0),
          hsized2,
          UiUtils.buildNormalText("Oven temperature displays usually have one or the other.", color: MyColor.black, fontSize:16.0),

          hsized10,
          UiUtils.buildMediumText("If we want to measure length we use millimetres, centimetres and metres", color: MyColor.black, fontSize:16.0),
          hsized2,
          UiUtils.buildMediumText("10 millimetres = 1 centimetre", color: MyColor.red1, fontSize:16.0),
          UiUtils.buildMediumText("100 centimetres = 1 metreI", color: MyColor.appTheme, fontSize:16.0),
          UiUtils.buildMediumText("1000 millimetres = 1 metre", color: MyColor.darkOrange, fontSize:16.0),
          hsized20,
          UiUtils.aboutHygieneBoy("Q. What did the spoon say to the knife?","A. Have a knife day!"),
          hsized60

        ],
      ),
    ));
  }
}
