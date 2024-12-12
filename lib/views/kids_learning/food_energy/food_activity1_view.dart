import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_activity4_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class FoodActivity1View extends StatefulWidget {
  const FoodActivity1View({super.key});

  @override
  State<FoodActivity1View> createState() => _FoodActivity1ViewState();
}

class _FoodActivity1ViewState extends State<FoodActivity1View> {
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
                    text: "Activity 2.1"),
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
                        hsized10,
                        UiUtils.buildBoldText("Energy for Life",
                            fontSize: 23.0, color: MyColor.pink),

                        hsized10,
                        UiUtils.buildNormalText(
                            "Energy comes in many different forms. Two of these forms are growth and light.",
                            fontSize: 16.0,
                            color: MyColor.black),

                        hsized10,
                        UiUtils.buildNormalText(
                            "Energy doesn’t disappear— it only changes. When a plant grows, it gets its energy from the light of the sun.",
                            fontSize: 16.0,
                            color: MyColor.black),

                        hsized10,

                        UiUtils.buildParagraph("", "Question: ",
                            "Must plants have energy from the sun to live?",
                            color: MyColor.black),

                        hsized10,

                        UiUtils.buildParagraph(
                            "A. Plants ", "need ", "the sun’s energy to live.",
                            color: MyColor.black),
                        hsized2,
                        UiUtils.buildNormalText("OR"),
                        hsized2,
                        UiUtils.buildParagraph("B. Plants ", "do not ",
                            "need the sun’s energy to live.",
                            color: MyColor.black),

                        hsized20,
                        UiUtils.buildBoldText("What you need",
                            fontSize: 18.0, color: MyColor.darkSky),

                        hsized10,
                        UiUtils.buildBulletPoints([
                          "Two plants that are the same.",
                          "Large brown paper bag that will fit over plant.",
                          "Water.",
                          "The sun.",
                        ]),

                        hsized20,
                        UiUtils.buildBoldText("What you need",
                            fontSize: 18.0, color: MyColor.darkSky),

                        hsized10,
                        UiUtils.buildSteps([
                          "Place two plants in a sunny place.",
                          "Cover one plant with a brown paper bag.",
                          "Give both plants the same amount of water.",
                          "Observe the plants for two weeks.",
                        ]),

                        hsized20,
                        UiUtils.buildBoldText("Analysis and Conclusion",
                            fontSize: 18.0, color: MyColor.darkSky),

                        hsized10,

                        UiUtils.buildNormalText(
                            "In your class, answer and talk about the questions below.",
                            fontSize: 16.0,
                            color: MyColor.black),
                        hsized5,
                        UiUtils.buildNormalText(
                            "Which plant looked healthier after two weeks?",
                            fontSize: 16.0,
                            color: MyColor.black),
                        hsized5,
                        UiUtils.buildNormalText(
                            "Was your guess correct?",
                            fontSize: 16.0,
                            color: MyColor.black),
                        hsized5,
                        UiUtils.buildNormalText(
                            "What energy changes did your experiment show?",
                            fontSize: 16.0,
                            color: MyColor.black),

                        hsized20,
                      ],
                    ),
                  ),

                  hsized20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity, onTap,55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)),
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


  // Widget _buildBulletPoints(List<String> points) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: points
  //         .map((point) => Text("• $point",
  //             style:
  //                 regularNormalTextStyle(fontSize: 16.0, color: MyColor.black)))
  //         .toList(),
  //   );
  // }



  void onTap() {
    CustomNavigators.pushNavigate(FoodActivity4View(), context);
  }
}
