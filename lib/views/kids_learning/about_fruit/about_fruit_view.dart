import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/about_fruit/fruit_chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/about_fruit/fruit_chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/about_fruit/fruit_chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/vegetable_chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/vegetable_chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/vegetable_chapter1_view.dart';
import 'package:flutter/material.dart';

int fruitCurrentPage = 0;
List<String> skillList = [];
class AboutFruitView extends StatefulWidget {
  const AboutFruitView({super.key});

  @override
  State<AboutFruitView> createState() => _AboutFruitViewState();
}


final PageController _pageController = PageController();

class _AboutFruitViewState extends State<AboutFruitView> {
  List<Widget> pageList = [
    FruitChapter1View(),
    FruitChapter2View(),
    FruitChapter3View(img:AssetsPath.fruitAlphabetImg1,count: "1"),
    FruitChapter3View(img:AssetsPath.fruitAlphabetImg2,count: "2"),
    FruitChapter3View(img:AssetsPath.fruitAlphabetImg3,count: "3"),
    FruitChapter3View(img:AssetsPath.fruitAlphabetImg4,count: "4"),
  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: MyColor.darkPink,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color:fruitCurrentPage == 0?MyColor.darkPink:MyColor.white,
                padding: const EdgeInsets.only(top:50.0,left:20,right: 20,bottom: 20),
                child:UiUtils.hygieneAppBar(()=> Navigator.pop(context),text: "All About Fruit!",color: fruitCurrentPage == 0?MyColor.white:MyColor.black),
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: pageList.length,
                    controller: _pageController,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, int index) {
                      fruitCurrentPage = index;
                      return Container(child: pageList[fruitCurrentPage]);
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
                                    color: fruitCurrentPage == i
                                        ? MyColor.appTheme
                                        : fruitCurrentPage == 2
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
      fruitCurrentPage = value;
    });
  }


}
