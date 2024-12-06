import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

import '../safty_kitchen_view.dart';

class Chapter6View extends StatefulWidget {
  const Chapter6View({super.key});

  @override
  State<Chapter6View> createState() => _Chapter6ViewState();
}

class _Chapter6ViewState extends State<Chapter6View> {
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
                padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
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
                      "Safety in the kitchen",
                      style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only( left: 20, right:40),
                  child: Column(
                    children: [
                      UiUtils.questionAnswerUi(AssetsPath.img1,Languages.of(context)!.question1,Languages.of(context)!.answer1,1),
                      UiUtils.questionAnswerUi(AssetsPath.img2,Languages.of(context)!.question2,Languages.of(context)!.answer2,1),
                      UiUtils.questionAnswerUi(AssetsPath.img3,Languages.of(context)!.question3,Languages.of(context)!.answer3,3),
                      hsized80
                    ],
                  ),
                ),
              ),

            ],
          ),
        UiUtils.roundedPage()
        ],
      ),
    );
  }
}
