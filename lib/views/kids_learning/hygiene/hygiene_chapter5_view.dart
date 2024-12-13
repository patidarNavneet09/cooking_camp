import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:flutter/material.dart';

class HygieneChapter5View extends StatefulWidget {
  const HygieneChapter5View({super.key});

  @override
  State<HygieneChapter5View> createState() => _HygieneChapter5ViewState();
}

class _HygieneChapter5ViewState extends State<HygieneChapter5View> {
  final EdgeInsets _defaultPadding = const EdgeInsets.only(left: 20, right: 20, top: 5);

  // Reusable Text Widget
  Widget _buildSongText(String text, {double fontSize = 15.0, Color? color}) {
    return UiUtils.buildBoldText(
      text,
      fontSize: fontSize,
      color: color ?? MyColor.appTheme,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColor.colorE5FFF0,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: UiUtils.hygieneAppBar(() => Navigator.pop(context), color: MyColor.black),
        ),
      ),
      body: Padding(
        padding: _defaultPadding,
        child: SizedBox(
          height: size.height * 0.7,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.12),
                child: CustomPaint(
                  painter: ExactCurvePainter(),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: size.height * 0.01, top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildSongText("Hand Washing Song", fontSize: 23.0, color: MyColor.green),
                          hsized5,
                          _buildSongText("Washing Those Germs Away!", fontSize: 15.0, color: MyColor.black),
                          hsized8,
                          _buildSongText(
                              "I’m going to wash those germs right out of my hands, I’m going to scrub those bugs from under my nails and send them all away!"),
                          hsized10,
                          _buildSongText(
                              "I’m going to soap up those germs right out of my hands and scare those germs from under my nails and watch them run away!"),
                          hsized13,
                          _buildSongText(
                              "I’m going to rinse those germs right out of my hands! I’m going to rinse those germs from under my nails! I’m going to rinse those germs right out of this place, and send them on their way!"),
                          hsized50,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Image.asset(
                      AssetsPath.singingGirl,
                      height: 181,
                      width: 97,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: _buildSongText(
                          "(*Sung to South Pacific chorus of “I’m Gonna Wash That Man Right Outta My Hair” By Richard Rogers.)",
                          fontSize: 15.0,
                          color: MyColor.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

