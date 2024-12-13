import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class HygieneChapter6View extends StatefulWidget {
  const HygieneChapter6View({super.key});

  @override
  State<HygieneChapter6View> createState() => _HygieneChapter6ViewState();
}

class _HygieneChapter6ViewState extends State<HygieneChapter6View> {
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
        padding: EdgeInsets.symmetric(horizontal:20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              UiUtils.buildBoldText("The best way to stop germs from travelling is?",color:MyColor.green,fontSize:20.0),

              hsized10,
              UiUtils.buildMediumText("You guessed it!",color:MyColor.appTheme,fontSize:18.0),
              hsized5,
              UiUtils.buildRegularText("We can keep germs away by:",color:MyColor.black,fontSize:16.0),
          hsized5,
              UiUtils.buildSemiBoldText("1. Keep hands clean and always wash hands before you cook.",color:MyColor.appTheme,fontSize:16.0),
              hsized5,
              UiUtils.buildSemiBoldText("2. Washing our fruit and vegetables",color:MyColor.pink,fontSize:16.0),
            hsized5,
              UiUtils.buildSemiBoldText("3. Keeping dishes and tea towels clean",color:MyColor.red1,fontSize:16.0),

             hsized5,
              UiUtils.buildSemiBoldText("4. Keep your kitchen surfaces clean.",color:MyColor.darkBlue,fontSize:16.0),

             hsized5,
              UiUtils.buildSemiBoldText("5. Wear your apron",color:MyColor.green,fontSize:16.0),

              hsized5,
              UiUtils.buildSemiBoldText("6. Hair tied up when you are cooking", color: MyColor.darkSky, fontSize: 16.0),
            hsized5,
              UiUtils.buildSemiBoldText("7. Keeping your meat and vegetables separate", color: MyColor.darkOrange, fontSize: 16.0),

              UiUtils.aboutHygieneBoy("Q. What are germs’ least favourite TV shows?","A. Soap Operas!")
            ],
          ),
        ),
      ),
    );
  }
}
