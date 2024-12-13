import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class HygieneChapter4View extends StatefulWidget {
  const HygieneChapter4View({super.key});

  @override
  State<HygieneChapter4View> createState() => _HygieneChapter4ViewState();
}

class _HygieneChapter4ViewState extends State<HygieneChapter4View> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left:20,right:20,top: 55),
        child: Column(
          children: [
            UiUtils.hygieneAppBar(()=> Navigator.pop(context),color:MyColor.black),

            hsized20,
            Expanded(
              child: SingleChildScrollView(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    UiUtils.buildBoldText("Wash hands clean",fontSize:23.0,color:MyColor.green),
                    hsized20,
                    Image.asset(AssetsPath.washHandClean),
                    hsized50,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
