import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';

class FoodChapter8View extends StatelessWidget {
  const FoodChapter8View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hsized40,
              UiUtils().foodEnergyAppBar(() => Navigator.pop(context)),
              hsized20,

              // Section Title
              Text(
                "A Healthy Diet",
                style: boldTextStyle(fontSize: 22.0, color: MyColor.pink),
              ),
              hsized10,
              Text(
                "It is important to have a good diet.",
                style: boldTextStyle(fontSize:16.0, color: MyColor.sky1),
              ),
              hsized20,

              // Paragraph 1
              _buildParagraph(
                  "A good diet is called a ",
                  "balanced diet",
                  ". So you don’t eat too much of one thing and not enough of something else."),
              hsized10,
              _buildRegularText(
                  "Imagine if you ate only rice every day and nothing else?"),
              _buildRegularText("How boring for you and your tummy."),
              hsized10,
              _buildRegularText(
                  "Problem is you would only get one set of nutrients and miss out on a whole lot of other very important ones."),
              _buildRegularText(
                  "So you need to eat a variety of food to stay healthy."),
              hsized20,

              // Highlighted Text
              _buildColoredText("A balanced diet = lots of different foods.",
                  color: MyColor.pink),
              _buildColoredText("Out of balance = Too much or too little",
                  color: MyColor.pink),
              hsized10,

              // Paragraph 2
              _buildRegularText(
                  "If you eat more than your body needs your body will store this as fat and you will feel tired and have no energy. If you eat too little you have too little energy and feel just as tired."),
              hsized10,
              _buildBoldText(
                  "SO too much and too little can affect your health and make you feel tired"),
              hsized20,

              // Box with Tip
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: MyColor.sky1.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColor.sky1, width: 1),
                ),
                child: Text(
                  "Some foods like fast food, lollies and cakes have high levels of sugar, fats and carbohydrates and can easily put us out of balance if we eat too much.",
                  style: boldTextStyle(fontSize: 14.0, color: MyColor.sky1),
                ),
              ),
              hsized20,

              // Green Emphasis Text
              Text(
                "Remember, the healthier the food you eat the stronger you are and the more energy you have!",
                style: boldTextStyle(fontSize: 16.0, color: MyColor.green),
              ),

              hsized90
            ],
          ),
        ),
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
              style: boldTextStyle(fontSize: 16.0, color: MyColor.pink)),
          TextSpan(text: suffix),
        ],
      ),
    );
  }


  Widget _buildRegularText(String text) {
    return Text(
      text,
      style: regularNormalTextStyle(fontSize: 15.0, color: MyColor.black),
    );
  }
  Widget _buildBoldText(String text) {
    return Text(
      text,
      style: boldTextStyle(fontSize: 15.0, color: MyColor.black),
    );
  }

  Widget _buildColoredText(String text, {required Color color}) {
    return Text(
      text,
      style: semiBoldTextStyle(fontSize: 15.0, color: color),
    );
  }
}
