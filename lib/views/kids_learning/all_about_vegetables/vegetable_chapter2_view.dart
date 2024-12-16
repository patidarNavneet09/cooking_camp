import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class VegetableChapter2View extends StatelessWidget {
  const VegetableChapter2View({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiUtils.buildBoldText("All about Vegetables",fontSize:20.0,color: MyColor.sky),
            hsized5,
            UiUtils.buildNormalText("Vegetables give us the vitamins and minerals we need to stay alive. As well as eating a rainbow a day you should try to eat 5 different vegetables every day to give your body all the nutrition it needs to grow up and stay healthy!",fontSize:16.0),

            hsized10,
            Image.asset(AssetsPath.vegetablesChapter2Img)
          ],
        ),
      ),
    );
  }
}
