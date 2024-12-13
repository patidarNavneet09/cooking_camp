import 'package:cooking_champs/constant/assets_path.dart';
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
import 'package:cooking_champs/views/kids_learning/the_basic/basic_chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_chapter4_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_chapter5_view.dart';
import 'package:flutter/material.dart';

int basicCurrentPage = 0;
List<String> skillList = [];
class TheBasicView extends StatefulWidget {
  const TheBasicView({super.key});

  @override
  State<TheBasicView> createState() => _TheBasicViewState();
}


final PageController _pageController = PageController();

class _TheBasicViewState extends State<TheBasicView> {
  List<Widget> pageList = [
    BasicChapter1View(),
    BasicChapter2View(),
    BasicChapter3View(image:AssetsPath.basicImg1,height:630,),
    BasicChapter3View(image:AssetsPath.basicImg2,height:590),
    BasicChapter3View(image:AssetsPath.basicImg3,height:730),
    BasicChapter3View(image:AssetsPath.basicImg4,height:613),
    BasicChapter3View(image:AssetsPath.basicImg5,height:640),
    BasicChapter3View(image:AssetsPath.basicImg6,height:730),
    BasicChapter3View(image:AssetsPath.basicImg7,height:571),
    BasicChapter3View(image:AssetsPath.basicImg8,height:400),
    BasicChapter4View(),
    BasicChapter5View(),
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
          Column(
            children: [
              Container(
                color:basicCurrentPage == 0?MyColor.purple:MyColor.white,
                padding: const EdgeInsets.only(top:40.0,left:20,right: 20,bottom: 20),
                child:UiUtils.hygieneAppBar(()=> Navigator.pop(context),text: "The Basic",color: basicCurrentPage == 0?MyColor.white:MyColor.black),
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: pageList.length,
                    controller: _pageController,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, int index) {
                      return Container(child: pageList[basicCurrentPage]);
                    }),
              ),
            ],
          ),


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
                                    color: basicCurrentPage == i
                                        ? MyColor.appTheme
                                        : basicCurrentPage == 2
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
      basicCurrentPage = value;
    });
  }


}
