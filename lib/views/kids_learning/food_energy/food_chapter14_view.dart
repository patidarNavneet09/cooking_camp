import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter14View extends StatelessWidget {
  const FoodChapter14View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: UiUtils().foodEnergyAppBar(() => Navigator.pop(context)),
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
                        hsized20,
                        UiUtils.buildBoldText("Italy",
                            fontSize: 20.0, color: MyColor.pink),

                        hsized5,
                        // Additional content for bottom section
                        _buildParagraph(
                            "Minestrone ",
                            suffix2:
                                "is a very popular Italian soup. If you travel around Italy you will find many versions. Two things are the same:-it is always made with lots of vegetable and is super delicious.",
                            "",
                            ""),

                        hsized10,

                        UiUtils.buildBoldText("All about Italy",
                            fontSize: 16.0, color: MyColor.sky),

                        hsized10,
                        _buildParagraph(
                            "",
                            suffix2:
                                "There are 59,332,501 million people living in Italy today. The Ancient city of ",
                            "Rome ",
                            "is the capital. Italy is famous for its food. Who doesn’t ",
                            highlight2: "love Pizza, Pasta or Gelati?"),

                        hsized15,
                        _buildParagraph(
                            "",
                            suffix2: "Italians eat what is called a ",
                            "Mediterranean diet.",
                            " It uses olive oil, lots of vegetables and pulses. They say that the Mediterranean diet is the healthiest diet you can eat! ",
                            highlight2: ""),

                        hsized15,
                        UiUtils.buildNormalText(
                            "Apart from the food, Italy is also famous for its fashion, arts, cars like the Ferrari and football!"),

                        hsized10,
                        _buildParagraph(
                          "Some History: Rome ",
                          suffix2: "is where gladiators fought in the great ",
                          "Colosseum ",
                          "thousands of years ago. ",
                          highlight2: "Venice",
                          suffix4:
                              " is a city built on a lagoon and people travel around on boats!",
                          highlight3: "Michelangelo ",
                          suffix6:
                              "painted the ceiling of a church called the ",
                          highlight4: "Sistine Chapel ",
                          suffix8: "upside down!",
                        ),
                        hsized20,
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: UiUtils.extensionBox(
                          "On a world map find Italy, which countries neighbour it? Is  it close or far from where you live?",
                          imgHeight: 125)),
                  hsized100
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildParagraph(String highlight, String highlight1, String suffix,
      {String suffix2 = "",
      String highlight2 = "",
      String suffix4 = "",
      String highlight3 = "",
      String suffix6 = "",
      String highlight4 = "",
      String suffix8 = ""}) {
    return RichText(
      text: TextSpan(
        // style: boldTextStyle(fontSize: 16.0, color: MyColor.black),
        children: [
          TextSpan(
              text: highlight,
              style: boldTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: suffix2,
              style:
                  regularNormalTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: highlight1,
              style: boldTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: suffix,
              style:
                  regularNormalTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: highlight2,
              style: boldTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: suffix4,
              style:
                  regularNormalTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: highlight3,
              style: boldTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: suffix6,
              style:
                  regularNormalTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: highlight4,
              style: boldTextStyle(fontSize: 16.0, color: MyColor.black)),
          TextSpan(
              text: suffix8,
              style:
                  regularNormalTextStyle(fontSize: 16.0, color: MyColor.black)),
        ],
      ),
    );
  }
}
