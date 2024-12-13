import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_activity5_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';

class HygieneActivity4 extends StatelessWidget {
  const HygieneActivity4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top:30.0,bottom:5),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiUtils.hygieneAppBar(()=> Navigator.pop(context),color:MyColor.black,text:"Activity 3.4"),
                  
                  UiUtils.bookReadGirl(MyColor.green,AssetsPath.bookReadImg)
                ],
              ),
            ),


            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiUtils.buildBoldText("Science experiment about germs",fontSize:20.0,color: MyColor.green),

                    hsized10,

                    UiUtils.buildBoldText("How Do Germs Spread?",fontSize: 17.0,color: MyColor.darkSky),

                    hsized8,
                    UiUtils.buildNormalText("This experiment shows how germs and viruses can live on our hands and be passed from person to person. Choose a partner before you start.",),
                    hsized20,

                    UiUtils.buildBoldText("You Need",fontSize: 17.0,color: MyColor.darkSky),

                    hsized8,
                    UiUtils.buildNormalText("Hand lotion, Glitter, Large bucket, Paper towels, Soap and warm water.",fontSize: 16.0, color: MyColor.black),

                    hsized20,

                    UiUtils.buildBoldText("What You Do",fontSize: 17.0,color: MyColor.darkSky),

                    hsized8,
                    UiUtils.buildStepsNormal([
                      "Put a drop of lotion on your hands and rub them together to spread the lotion out evenly.",
                      "With your hands over a sink or large bucket, have partner 2 put a pinch of glitter in the palm of one partner's hand.",
                      "Now press the palms of your hands together or pull your fingers. What do you notice about your hands?",
                      "Shake your partner's hand. Now do you see anything on it?",
                      "Check your partner's hand.",
                      "Get a paper towel and use it to wipe your hands clean of all the glitter. Is it working?",
                      "After using the paper towel,",
                      "Wash your hands with soap and water. Did it get the glitter off?"
                    ],bottomPadding:5.0),

                    hsized20,
                    UiUtils.buildBoldText("What Happened?",fontSize: 17.0,color: MyColor.darkSky),
                    hsized8,
                    UiUtils.buildBulletPoints([
                      "When you touched your friend's hands?",
                      "Did the glitter spread to anything else you touched?",
                      "Did the paper towel remove all the glitter?",
                      "Did the soap and warm water remove the glitter?"
                    ]),

                    hsized10,
                    Text(
                      "So Germs are much like the glitter. The difference is that you can’t see them so it’s really important that you wash your hands because they spread just like the glitter!",
                      style: regularNormalTextStyle(fontSize: 16.0, color: MyColor.black),
                    ),
                    hsized20,
                    UiUtils.buildParagraph("","Remember: ","correct handwashing is important to get rid of all the germs that we can’t always see.",color: MyColor.black),

                    hsized50,

                    GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                            ()=>CustomNavigators.pushNavigate(HygieneActivity5View(),context),
                        55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)),

                    hsized80,
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
