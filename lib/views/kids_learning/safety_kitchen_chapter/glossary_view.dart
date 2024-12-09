import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:flutter/material.dart';

class GlossaryView extends StatefulWidget {
  const GlossaryView({super.key});

  @override
  State<GlossaryView> createState() => _GlossaryViewState();
}

class _GlossaryViewState extends State<GlossaryView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: MyColor.white,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20, right:0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      radius: 80,
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Glossary",
                      style:mediumTextStyle(fontSize: 18.0, color: MyColor.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hsized5,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Image.asset(AssetsPath.chapter12Img),
                      ),
                      //hsized15,
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal:20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(Languages.of(context)!.chemical,style: mediumTextStyle(fontSize:18.0, color:MyColor.black),),

                           hsized5,
                           Text(Languages.of(context)!.somethingYouCan,style:regularTextStyle(fontSize:15.0, color:MyColor.black),),

                           hsized15,
                           Text(Languages.of(context)!.extension,style: mediumTextStyle(fontSize:18.0, color:MyColor.black),),

                           hsized5,
                           Text(Languages.of(context)!.somethingExtraAnAddition,style:regularTextStyle(fontSize:15.0, color:MyColor.black),),

                           hsized15,
                           Text(Languages.of(context)!.glossary,style: mediumTextStyle(fontSize:18.0, color:MyColor.black),),

                           hsized5,
                           Text(Languages.of(context)!.aListOfTheHardOrUnusualWords,style:regularTextStyle(fontSize:15.0, color:MyColor.black),),


                           hsized15,
                           Text(Languages.of(context)!.hazard,style: mediumTextStyle(fontSize:18.0, color:MyColor.black),),

                           hsized5,
                           Text(Languages.of(context)!.dangerOrRisk,style:regularTextStyle(fontSize:15.0, color:MyColor.black),),

                           hsized15,
                           Text(Languages.of(context)!.rules,style: mediumTextStyle(fontSize:18.0, color:MyColor.black),),

                           hsized5,
                           Text(Languages.of(context)!.aLawOrDirectionThatTellsUsHow,style:regularTextStyle(fontSize:15.0, color:MyColor.black),),
                         ],
                       ),
                     ),

                      hsized80
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
