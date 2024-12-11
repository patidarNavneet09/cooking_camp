import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:flutter/material.dart';

class FoodChapter11View extends StatelessWidget {
  const FoodChapter11View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.lightPink,

      body: Container(
        alignment: Alignment.center,
       padding: EdgeInsets.symmetric(horizontal:20),
       child:    Image.asset(AssetsPath.foodChapter11Img)

      ),
    );
  }

}
