import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class SenseChapter2View extends StatelessWidget {
  const SenseChapter2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiUtils.buildBoldText("Our Senses", color: MyColor.red1,fontSize:20.0),
            hsized5,
            UiUtils.buildParagraph("Our ", "senses",
                " pick up signals from the outside world and send them to our",
                color: MyColor.orange,
                highlight1: " brain",
                prefix1: " You might say that they make",
                highlight2: " sense",
                prefix2:
                    " of what is going on outside our body! He! He!  Imagine how it would be if we didn’t have any senses, it’s a little scary",
            highlightFontSize:16.0,
            regularFontSize:16.0),

            hsized10,
            Image.asset(AssetsPath.senseChapter2Img),

            hsized15,
            UiUtils.buildNormalText("Usually our senses work together to make a whole picture. This protects us when we are out in the world. But also lets us enjoy the world around us."),
            
            hsized25,
            UiUtils.buildFunFact(title:"Fun Fact", fact:"Scientists have found that if one sense shuts down, the brain will try to make up for it so that other senses become stronger! Wow!"),

            hsized100,
            hsized50,

          ],
        ),
      ),
    );
  }
}
