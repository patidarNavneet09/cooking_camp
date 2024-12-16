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
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter4_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter5_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter6_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter7_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter8_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_chapter9_view.dart';
import 'package:flutter/material.dart';

int hygieneCurrentPage = 0;
List<String> skillList = [];
class AllAboutHygieneView extends StatefulWidget {
  const AllAboutHygieneView({super.key});

  @override
  State<AllAboutHygieneView> createState() => _AllAboutHygieneViewState();
}


final PageController _pageController = PageController();

class _AllAboutHygieneViewState extends State<AllAboutHygieneView> {
  List<Widget> pageList = [
    HygieneChapter1View(),
    HygieneChapter2View(),
    HygieneChapter3View(),
    HygieneChapter4View(),
    HygieneChapter5View(),
    HygieneChapter6View(),
    HygieneChapter7View(),
    HygieneChapter8View(),
    HygieneChapter9View(),
    FoodChapter10View(),
    FoodChapter11View(),
    FoodChapter12View(),
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
                hygieneCurrentPage = index;
                return Container(child: pageList[hygieneCurrentPage]);
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
                                    color: hygieneCurrentPage == i
                                        ? MyColor.appTheme
                                        : hygieneCurrentPage == 2
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
      hygieneCurrentPage = value;
    });
  }


}
