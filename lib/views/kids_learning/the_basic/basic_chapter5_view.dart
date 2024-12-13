import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/static_model/cooking_techniques_model.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BasicChapter5View extends StatelessWidget {
  const BasicChapter5View({super.key});

  @override
  Widget build(BuildContext context) {
    final techniques = getCookingTechniques();
    return  Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal:20.0),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiUtils.buildBoldText("The Basic HOW TO Cooking techniques",color:MyColor.appTheme,fontSize:20.0),
            hsized15,
            UiUtils.buildBoldText("Cooking Techniques",color:MyColor.green,fontSize:16.0),
            hsized2,
            Container(
              height:2,
              width:176,
              color: MyColor.green,
            ),

        hsized20,
        ListView.builder(
          itemCount: techniques.length,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap:true,
          itemBuilder: (context, index) {
            final technique = techniques[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(technique.image, width:122, height:108, fit: BoxFit.cover),
                hsized3,
                UiUtils.buildParagraph("","${technique.title} : ", technique.description,color: MyColor.black),
                hsized10
              ],
            );

          },
        ),

            hsized100
          ],
        ),
      ),
    );
  }
}
