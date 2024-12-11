import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter7View extends StatefulWidget {
  const FoodChapter7View({super.key});

  @override
  State<FoodChapter7View> createState() => _FoodChapter7ViewState();
}

class _FoodChapter7ViewState extends State<FoodChapter7View> {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor:MyColor.white,
      body: Column(
        children: [
          hsized50,
        Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
       child: UiUtils().foodEnergyAppBar(onTap)),

          Expanded(
              child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hsized20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text("Travels of a trail mix",style:boldTextStyle(fontSize:23.0, color:MyColor.pink),),
                ),
                hsized20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5.0),
                  child: Image.asset(AssetsPath.foodChapter7Img),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  void onTap() {
    Navigator.pop(context);
  }
}
