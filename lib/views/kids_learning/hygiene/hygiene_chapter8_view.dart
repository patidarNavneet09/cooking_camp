import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class HygieneChapter8View extends StatefulWidget {
  const HygieneChapter8View({super.key});

  @override
  State<HygieneChapter8View> createState() => _HygieneChapter8ViewState();
}

class _HygieneChapter8ViewState extends State<HygieneChapter8View> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: MyColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20,bottom:10),
          child: UiUtils.hygieneAppBar(() => Navigator.pop(context), color: MyColor.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              UiUtils.buildBoldText("Kitchen clean up",fontSize:22.0,color:MyColor.green),
              hsized15,
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(AssetsPath.kitchenCleanUpImg2,height:720,)),

              hsized100
            ],
          ),
        ),
      ),
    );
  }
}
