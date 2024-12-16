import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class VegetableChapter3View extends StatefulWidget {
  final String img;
 final String count;
  const VegetableChapter3View({super.key,required this.img,required this.count});

  @override
  State<VegetableChapter3View> createState() => _VegetableChapter3ViewState();
}

class _VegetableChapter3ViewState extends State<VegetableChapter3View> {
  String image = AssetsPath.vegetableAlphabetImg1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.buildBoldText("My Vegetable Alphabet",
                    color: MyColor.sky, fontSize: 23.0),
                UiUtils.buildMediumText(
                  "${widget.count}/4",
                  color: MyColor.black,
                ),
              ],
            ),

            hsized20,
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(widget.img),

                  Visibility(
                      visible:  widget.count == "4",
                      child: UiUtils.buildFunFact(title:"Fun Fact", fact:"The part of broccoli you eat is actually baby flowers that haven’t opened yet. Once the flowers open, the broccoli tastes bitter.")),

                  hsized100
                ],
              ),
            ))

          ],
        ),
      ),
    );
  }
}
