import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter12View extends StatelessWidget {
  const FoodChapter12View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,

      body: Column(
        children: [

          Padding(padding: EdgeInsets.only(left:20,right: 20,top:50),
          child: UiUtils().foodEnergyAppBar(() =>  Navigator.pop(context)),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hsized20,
                  _buildColoredSection(
                    title: "MORE TIPS ABOUT HOW TO STAY BALANCED",
                    color: MyColor.pink,
                    fontSize: 16,
                  ),
                  _buildColoredSection(
                    title: "Make sure you have at least 30 minute of Physical activity every day.",
                    color: MyColor.sky1,
                    fontSize: 16,
                  ),
                  _buildBoldText("Enjoy your Food.", MyColor.appTheme),
                  _buildBoldText("Don't eat too fast.", MyColor.red1),
                  _buildBoldText(
                    "Listen to your tummy. It tells you if you are hungry or full.",
                    MyColor.darkOrange,
                  ),
                  _buildBoldText("Say No to too much fast food.", MyColor.darkBlue),
                  _buildBoldText(
                    "Try to eat 2 fruits and 5 serves vegetables a day!",
                    MyColor.pink,
                  ),

                  _buildBoldText("Eat more whole grains", MyColor.green),

                  _buildBoldText(
                    "Make half your Plate Vegetables and Fruit",
                    MyColor.appTheme,
                  ),
                  _buildBoldText("Try fruit for dessert.", MyColor.sky1),
                  const SizedBox(height:10),

                  // Additional content for bottom section
                  _buildParagraph(
                      "Only eat food that is high in added sugars, salts and solid fats ",
                      "occasionally ",
                      "NOT as a part of your everyday meals."),
                  const SizedBox(height: 15),
                  _buildParagraph(
                      "Make sugary drinks a treat so ",
                      "drink water ",
                      "when you are thirsty because it's really good for you."),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildParagraph(String prefix, String highlight, String suffix) {
    return RichText(
      text: TextSpan(
        style: regularNormalTextStyle(fontSize: 16.0, color: MyColor.black),
        children: [
          TextSpan(text: prefix),
          TextSpan(
              text: highlight,
              style: regularTextStyle(fontSize: 16.0, color: MyColor.pink)),
          TextSpan(text: suffix),
        ],
      ),
    );
  }
  /// Widget for bold section header with color
  Widget _buildColoredSection({
    required String title,
    required Color color,
    double fontSize = 16.0,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: boldTextStyle(fontSize: fontSize, color: color),
      ),
    );
  }

  /// Widget for bold text with a specific color
  Widget _buildBoldText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0,bottom: 2),
      child: Text(
        text,
        style: boldTextStyle(fontSize: 16.0, color: color),
      ),
    );
  }


}
