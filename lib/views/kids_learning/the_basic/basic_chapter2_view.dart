import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BasicChapter2View extends StatelessWidget {
  const BasicChapter2View({super.key});

  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context);
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiUtils.buildBoldText("Every cook needs special tools.",fontSize:20.0,color:MyColor.green),
                    hsized3,
                    Container(decoration: BoxDecoration(color: MyColor.green),height:2,width: size.size.width * 0.79,),
            
                    hsized13,
                    UiUtils.buildMediumText("In your kit you have a",fontSize:16.0,color:MyColor.black),
            
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: UiUtils.buildBulletPoints([
                        "Cooking champ’s knife,",
                        "Cooking champs Peeler",
                        "Cooking Champ’s Apron."
                      ],bottomPadding:5.0),
                    ),
            
                    hsized10,
            
                    UiUtils.buildNormalText("You must always use these whenever you cook because they keep you safe."),
                  hsized15,
                    UiUtils.buildNormalText("No matter what your job, you will often need special tools to do the job properly. It’s the same for cooks in the kitchen."),
            
                    UiUtils.buildSemiBoldText("There are lots of tools you can use in the kitchen.",color:MyColor.darkOrange),
                    hsized10,
                    UiUtils.buildSemiBoldText("Choosing the right tools for the job makes cooking easier.",color:MyColor.darkSky),
                    hsized10,
                    UiUtils.buildSemiBoldText("Take a look at all the different tools you can use.",color:MyColor.darkBlue),
            
                    Image.asset(AssetsPath.sheffImg2),

                    hsized100
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
