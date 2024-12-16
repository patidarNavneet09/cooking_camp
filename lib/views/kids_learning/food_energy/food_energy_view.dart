import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter10_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter11_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter12_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter14_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter4_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter5_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter6_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter7_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter8_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter9_view.dart';
import 'package:flutter/material.dart';

import 'food_chapter13_view.dart';
int currentPage = 0;
List<String> skillList = [];
class FoodEnergyView extends StatefulWidget {
  const FoodEnergyView({super.key});

  @override
  State<FoodEnergyView> createState() => _FoodEnergyViewState();
}


final PageController _pageController = PageController();

class _FoodEnergyViewState extends State<FoodEnergyView> {
  List<Widget> pageList = [
    FoodEnergyChapter1View(),
    FoodEnergyChapter2View(),
    FoodEnergyChapter3View(),
    FoodChapter4View(),
    FoodChapter5View(),
    FoodChapter6View(),
    FoodChapter7View(),
    FoodChapter8View(),
    FoodChapter9View(),
    FoodChapter10View(),
    FoodChapter11View(),
    FoodChapter12View(),
    FoodChapter13View(),
    FoodChapter14View(),
  ];


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: MyColor.orange,
      body: Stack(
        children: [
          PageView.builder(
              itemCount: pageList.length,
              controller: _pageController,
              onPageChanged: onPageChanged,
              itemBuilder: (context, int index) {
                currentPage =index;
                return Container(child: pageList[currentPage]);
              }),


          UiUtils.roundedPage()

        ],
      ),
      bottomNavigationBar: Container(
        color: MyColor.white,
        height: 50,
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
                                    color: currentPage == i
                                        ? MyColor.appTheme
                                        : currentPage == 2
                                        ? MyColor.blueLite1
                                        : const Color.fromARGB(
                                        255, 219, 217, 217),
                                    width: 10),
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
      height: 10,
      width: width,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }

  void onPageChanged(int value) {
    setState(() {
      currentPage = value;
    });
  }


}
