import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BasicActivity7View extends StatelessWidget {
  const BasicActivity7View({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom:0, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(() => Navigator.pop(context),
                    color: MyColor.black, text: "Activity 4.7"),
                UiUtils.bookReadGirl(MyColor.appTheme, AssetsPath.bookReadImg)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiUtils.buildBoldText("How can we seperate unwanted particles from flour?", fontSize: 23.0, color:MyColor.appTheme),
                hsized5,
                UiUtils.buildMediumText("Possible guesses (or Hypothesis)", fontSize: 16.0, color:MyColor.black),

                hsized5,
                UiUtils.buildNormalText("A. If we use a fine sieve the dry fine particles will go through the sieve and the course particles will remain behind. Or A. All dry ingredients will go through the sieve", fontSize: 16.0, color:MyColor.black),

                hsized10,
                UiUtils.buildSemiBoldText("Possible guesses (or Hypothesis)", fontSize: 16.0, color:MyColor.darkSky),
                hsized5,
                UiUtils.buildBulletPoints([
                  "½ cup flour",
                  "1 tablespoon lentils",
                  "1 teaspoon whole peppercorns",
                  "Fine sieve",
                  "Bowl larger than sieve"
                ]),
                hsized10,
                UiUtils.buildSemiBoldText("What you have to do", fontSize: 16.0, color:MyColor.darkSky),
                hsized8,
                UiUtils.buildNormalText("Mix all ingredients together and place in a sieve Gently tap sieve over bowl.", fontSize: 16.0, color:MyColor.darkSky),
                UiUtils.buildMediumText("What is left behind? What is in the bowl?", fontSize: 16.0, color:MyColor.darkSky),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
