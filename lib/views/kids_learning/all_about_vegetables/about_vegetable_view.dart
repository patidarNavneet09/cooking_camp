import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/vegetable_chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/vegetable_chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/vegetable_chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/vegetable_chapter4_view.dart';
import 'package:flutter/material.dart';

int vegetableCurrentPage = 0;
List<String> skillList = [];
class AboutVegetableView extends StatefulWidget {
  const AboutVegetableView({super.key});

  @override
  State<AboutVegetableView> createState() => _AboutVegetableViewState();
}


final PageController _pageController = PageController();

class _AboutVegetableViewState extends State<AboutVegetableView> {
  List<Widget> pageList = [
    VegetableChapter1View(),
    VegetableChapter2View(),
    VegetableChapter3View(img:AssetsPath.vegetableAlphabetImg1,count: "1"),
    VegetableChapter3View(img:AssetsPath.vegetableAlphabetImg2,count: "2"),
    VegetableChapter3View(img:AssetsPath.vegetableAlphabetImg3,count: "3"),
    VegetableChapter3View(img:AssetsPath.vegetableAlphabetImg4,count: "4"),
    VegetableChapter4View()

  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: MyColor.sky,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color:vegetableCurrentPage == 0?MyColor.sky:vegetableCurrentPage == 6? MyColor.colorE7F3FB:MyColor.white,
                padding: const EdgeInsets.only(top:50.0,left:20,right: 20,bottom: 20),
                child:UiUtils.hygieneAppBar(()=> Navigator.pop(context),text: "All About Vegetables",color: vegetableCurrentPage == 0?MyColor.white:MyColor.black),
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: pageList.length,
                    controller: _pageController,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, int index) {
                      vegetableCurrentPage = index;
                      return Container(child: pageList[vegetableCurrentPage]);
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
                                    color: vegetableCurrentPage == i
                                        ? MyColor.appTheme
                                        : vegetableCurrentPage == 2
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
      vegetableCurrentPage = value;
    });
  }


}
