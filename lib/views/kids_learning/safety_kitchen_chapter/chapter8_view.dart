import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

import '../safty_kitchen_view.dart';

class Chapter8View extends StatefulWidget {
  const Chapter8View({super.key});

  @override
  State<Chapter8View> createState() => _Chapter8ViewState();
}

class _Chapter8ViewState extends State<Chapter8View> {
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
                      UiUtils.questionAnswerUi(AssetsPath.img7,Languages.of(context)!.question7,Languages.of(context)!.answer7,7),
                      UiUtils.questionAnswerUi(AssetsPath.img8,Languages.of(context)!.question8,Languages.of(context)!.answer8,8),
                      UiUtils.questionAnswerUi(AssetsPath.img9,Languages.of(context)!.question9,Languages.of(context)!.answer9,9),
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
