import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter13View extends StatelessWidget {
  const FoodChapter13View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,

      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),
            child: UiUtils().foodEnergyAppBar(() => Navigator.pop(context)),
          ),
          hsized40,
          Container(
              padding: EdgeInsets.symmetric(horizontal:20),
              child:    Image.asset(AssetsPath.foodChapter13Img)

          ),
        ],
      ),
    );
  }

}
