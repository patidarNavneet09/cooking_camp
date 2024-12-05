import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:flutter/material.dart';

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
                      top: size.size.height * 0.05, left: 20, right: 20),
                  child: Column(
                    children: [
                    Image.asset(AssetsPath.chapter5)
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
