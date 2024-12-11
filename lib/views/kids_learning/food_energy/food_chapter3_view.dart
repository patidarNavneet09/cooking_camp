import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:flutter/material.dart';

class FoodEnergyChapter3View extends StatefulWidget {
  const FoodEnergyChapter3View({super.key});

  @override
  State<FoodEnergyChapter3View> createState() => _FoodEnergyChapter3ViewState();
}

class _FoodEnergyChapter3ViewState extends State<FoodEnergyChapter3View> {
  List<String> mixStoryList = [
    "• Trail mix is a super nutritious snack and high-in energy that is eaten all over the world.",
    "• It’s made of nuts, seeds, dried fruits and chocolate or carob and doesn’t need special storage so it can be taken anywhere.",
    "• People like hikers, explorers, pioneers, hunters, soldiers, scouts and even ancient travellers have been making and eating it for thousands of years! WOW!"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          radius: 80,
                          onTap: () {
                            setState(() {
                              currentIndex = 0;
                            });
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 28,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Food is energy",
                          style: mediumTextStyle(
                              fontSize: 18.0, color: MyColor.black),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "The trail mix story",
                    style: boldTextStyle(fontSize: 23.0, color: MyColor.pink),
                  ),
                  hsized8,
                  Text(
                    "• Trail mix is a super nutritious snack and high-in energy that is eaten all over the world.",
                    style: regularNormalTextStyle(
                        fontSize: 16.0, color: MyColor.black),
                  ),
                  hsized10,
                  Text(
                    "• It’s made of nuts, seeds, dried fruits and chocolate or carob and doesn’t need special storage so it can be taken anywhere.",
                    style: regularNormalTextStyle(
                        fontSize: 16.0, color: MyColor.black),
                  ),
                  hsized10,
                  Text(
                    "• People like hikers, explorers, pioneers, hunters, soldiers, scouts and even ancient travellers have been making and eating it for thousands of years! WOW!",
                    style: regularNormalTextStyle(
                        fontSize: 16.0, color: MyColor.black),
                  ),
                ],
              ),
            ),
            hsized10,
            Image.asset(AssetsPath.foodChapterImg3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hsized10,
                  Text(
                    "• In some European countries like Germany, Poland and Hungary, trail mix is called “student food” or “student snack”.",
                    style: regularNormalTextStyle(
                        fontSize: 16.0, color: MyColor.black),
                  ),
                  hsized10,
                  Text(
                    "• In New Zealand they call it “scroggin” or “schmogle” He He!",
                    style: regularNormalTextStyle(
                        fontSize: 16.0, color: MyColor.black),
                  ),
                  hsized10,
                  Text(
                    "• In America they call it GORP (It stands for Good Old Raisins and Peanuts)",
                    style: regularNormalTextStyle(
                        fontSize: 16.0, color: MyColor.black),
                  ),
                  hsized10,
                  Text(
                    "• There is even a special day to celebrate it! August 31 is National Trail Mix Day! Wow!",
                    style: regularNormalTextStyle(
                        fontSize: 16.0, color: MyColor.black),
                  ),
                ],
              ),
            ),
            hsized20,
            Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: UiUtils.extensionBox(
                    "On a map of the world, find Germany, Poland, Hungary, New Zealand and America. Are any of these countries close to each other? Which is the furthest away?",
                    rightPadding: 55)),
            hsized100
          ],
        ),
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
