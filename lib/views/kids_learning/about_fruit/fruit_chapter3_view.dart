import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FruitChapter3View extends StatefulWidget {
  final String img;
  final String count;
  const FruitChapter3View({super.key,required this.img,required this.count});

  @override
  State<FruitChapter3View> createState() => _FruitChapter3ViewState();
}

class _FruitChapter3ViewState extends State<FruitChapter3View> {
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
                UiUtils.buildBoldText("My Fruit Alphabet",
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
                          child:UiUtils.buildJokeSection("Q. If you have 13 apples in one hand and 10 oranges in the other, what do you have?","A. Big hands! He! HE!")),

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
