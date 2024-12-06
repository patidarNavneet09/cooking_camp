import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:flutter/material.dart';

import '../safty_kitchen_view.dart';

class Chapter5View extends StatefulWidget {
  const Chapter5View({super.key});

  @override
  State<Chapter5View> createState() => _Chapter5ViewState();
}

class _Chapter5ViewState extends State<Chapter5View> {
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
                  padding: EdgeInsets.only(top: size.size.height * 0.05, left: 20, right: 20),
                  child: Stack(
                    children: [

                    Image.asset(AssetsPath.chapter5Img,height: 500,width: double.infinity,),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top:size.size.height * 0.13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30,right: 30),
                              child: Text("Rules are a waste of time if we don’t understand why we need them.",
                              textAlign: TextAlign.center
                              ,style:semiBoldTextStyle(fontSize:16.0, color:MyColor.red1),),
                            ),

                            hsized15,
                            Padding(
                              padding: EdgeInsets.only(left: 30,right: 30),
                              child: Text("Good rules usually make sense so let’s look at the Cooking Champ kitchen rules a little more closely.",
                              textAlign: TextAlign.center
                              ,style:semiBoldTextStyle(fontSize:16.0, color:MyColor.red1),),
                            ),

                          hsized60,
                            Padding(
                              padding: EdgeInsets.only(left:20,right:20),
                              child: Image.asset(AssetsPath.chapter5Book,),
                            )
                          ],
                        ),
                      ),

                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Image.asset(AssetsPath.searchEmoji,height: 110,width:95,),
                    ),

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
