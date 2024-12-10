import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

import '../safty_kitchen_view.dart';

class Chapter9View extends StatefulWidget {
  const Chapter9View({super.key});

  @override
  State<Chapter9View> createState() => _Chapter9ViewState();
}

class _Chapter9ViewState extends State<Chapter9View> {
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
                      UiUtils.questionAnswerUi(AssetsPath.img10,Languages.of(context)!.question10,Languages.of(context)!.answer10,10),
                      UiUtils.questionAnswerUi(AssetsPath.img11,Languages.of(context)!.question11,Languages.of(context)!.answer11,11),
                      UiUtils.questionAnswerUi(AssetsPath.img12,Languages.of(context)!.question12,Languages.of(context)!.answer12,12),

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
