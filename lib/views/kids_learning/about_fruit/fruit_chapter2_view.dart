import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FruitChapter2View extends StatelessWidget {
  const FruitChapter2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiUtils.buildBoldText("All about Fruit",
                fontSize: 20.0, color: MyColor.sky),
            hsized5,
            UiUtils.buildNormalText(
                "The nutrients in fruit are important for health and keeping your body working well. You should try to eat 2 pieces of fruit a day and just like vegetables choose different colours.  Always choose whole fruits over fruit juice because they have lots of fibre and are more healthy. Fruit juices can be high in natural sugar and low in dietary fibre, and too much can even damage your teeth!!",
                fontSize: 16.0),
            hsized10,
            Image.asset(AssetsPath.fruitChapter2Img)
          ],
        ),
      ),
    );
  }
}
