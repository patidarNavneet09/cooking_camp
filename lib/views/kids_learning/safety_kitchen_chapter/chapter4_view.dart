import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../safty_kitchen_view.dart';

class Chapter4View extends StatefulWidget {
  const Chapter4View({super.key});

  @override
  State<Chapter4View> createState() => _Chapter4ViewState();
}

class _Chapter4ViewState extends State<Chapter4View> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: MyColor.orange,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55.0, left: 20, right: 20),
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
                  padding: EdgeInsets.only(
                      top: size.size.height * 0.02, left: 20, right: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            AssetsPath.chapter4Img,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal:30.0, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                hsized20,
                                Text(
                                  "Rhyming Rules for \nCooking Champ Kitchens",
                                  textAlign: TextAlign.center,
                                  style: boldTextStyle(
                                      fontSize: 18.0, color: MyColor.darkOrange),
                                ),
                                hsized20,
                                Text(
                                  "In the kitchen having fun, But please oh please don’t ever run! Aprons on and wash your hands, Clean those spills before they land!",
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle(
                                      fontSize: 14.0, color: MyColor.appTheme),
                                ),
                                hsized20,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                                  child: Text(
                                    "Bench tops cleaned and cords away, From stove tops where they must not stray. Watch for fire hazards too like, Paper towels and tea towels strewn.",
                                    textAlign: TextAlign.center,
                                    style: mediumTextStyle(
                                        fontSize: 14.0, color: MyColor.appTheme),
                                  ),
                                ),
                                hsized20,
                                Text(
                                  "Pot and pan handles turn them in, Never out where they can spin! Always follow Knife Safety Rules, Carefully held like treasured jewels.",
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle(
                                      fontSize: 14.0, color: MyColor.appTheme),
                                ),
                                hsized20,
                                Text(
                                  "Electrical equipment away from taps, And food near chemicals never match. Most important every day, From these rules little cooks must never stray",
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle(
                                      fontSize: 14.0, color: MyColor.appTheme),
                                ),
                                hsized20,
                                Text(
                                  "Please remember don’t forget,  Adults are your safety net.  If a problem comes one day  Call an adult straight away",
                                  textAlign: TextAlign.center,
                                  style: mediumTextStyle(
                                      fontSize: 14.0, color: MyColor.appTheme),
                                ),
                              ],
                            ),
                          ),
                          
                          Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(AssetsPath.photoroom,height:90,width:80,))
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AssetsPath.cornerBg,
                height: 120,
                width: 120,
              ))
        ],
      ),
    );
  }
}
