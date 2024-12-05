import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter4_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter5_view.dart';
import 'package:flutter/material.dart';

class SafetyKitchenView extends StatefulWidget {
  const SafetyKitchenView({super.key});

  @override
  State<SafetyKitchenView> createState() => _SafetyKitchenViewState();
}

class _SafetyKitchenViewState extends State<SafetyKitchenView> {
  List<Widget> pageList = [
    Chapter1View(),
    Chapter2View(),
    Chapter3View(),
    Chapter4View(),
    Chapter5View(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context);

    return  Scaffold(
      backgroundColor: MyColor.orange,

      body: PageView.builder(
          itemCount:pageList.length,
          onPageChanged: onPageChanged,
          itemBuilder: (context ,int index){
              return Container(
      child: pageList[currentIndex],
              );
            }),
      bottomNavigationBar: Container(
        color: MyColor.white,
        height:50,
        child: Container(
          alignment: Alignment.center,
          color: MyColor.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < pageList.length; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              SizedBox(
                                child: _indicatorDotsWidget(
                                    color: currentIndex == i
                                        ? MyColor.appTheme
                                        : currentIndex == 2
                                        ? MyColor.blueLite1
                                        : const Color.fromARGB(
                                        255, 219, 217, 217),
                                    width: currentIndex == i ? 32 : 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );

  }

  Container _indicatorDotsWidget(
      {required Color color, required double width}) {
    return Container(
      height: 11,
      width: width,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
  void onPageChanged(int value) {
    setState(() {
      currentIndex = value;
    });
  }
}
