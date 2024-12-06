import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:flutter/material.dart';

class Chapter10View extends StatefulWidget {
  const Chapter10View({super.key});

  @override
  State<Chapter10View> createState() => _Chapter10ViewState();
}

class _Chapter10ViewState extends State<Chapter10View> {
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
                      "Knife safety skills",
                      style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     Padding(
                       padding: const EdgeInsets.only(left:20,right:30.0,top: 20),
                       child: Stack(
                         children: [
                           Container(
                             margin: const EdgeInsets.only(bottom: 38.0),
                             child: Image.asset(AssetsPath.knifeSkillsImg1),
                           ),
                           Container(
                             padding: EdgeInsets.only(top:25),
                               alignment: Alignment.centerRight,
                               child: Image.asset(AssetsPath.knifeImg,height: 150,width: 150,)),
                         ],
                       ),
                     ),
                     // hsized40,
                     Padding(
                       padding: const EdgeInsets.only(left:20.0),
                       child: Image.asset(AssetsPath.knifeSkill2),
                     ),
                     hsized30,
                     Padding(
                       padding: const EdgeInsets.only(right:40.0),
                       child: Image.asset(AssetsPath.knifeSkillImg3),
                     ),

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
