import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:flutter/material.dart';

import '../../../utils/ui_utils.dart';

class HygieneChapter7View extends StatefulWidget {
  const HygieneChapter7View({super.key});

  @override
  State<HygieneChapter7View> createState() => _HygieneChapter7ViewState();
}

class _HygieneChapter7ViewState extends State<HygieneChapter7View> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: MyColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20,bottom: 20),
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
               Image.asset(AssetsPath.kitchenCleanUpImg1),
              hsized100
            ],
          ),
        ),
      ),
    );
  }
}
