import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/activity_one_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter10_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter11_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/safety_kitchen_glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter3_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter4_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter5_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter6_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter7_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter8_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/chapter9_view.dart';
import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/safty_quiz_time_view.dart';
import 'package:flutter/material.dart';

class SafetyKitchenView extends StatefulWidget {
  const SafetyKitchenView({super.key});

  @override
  State<SafetyKitchenView> createState() => _SafetyKitchenViewState();
}

int currentIndex = 0;
final PageController _pageController = PageController();

class _SafetyKitchenViewState extends State<SafetyKitchenView> {
  List<Widget> pageList = [
    Chapter1View(),
    Chapter2View(),
    Chapter3View(),
    Chapter4View(),
    Chapter5View(),
    Chapter6View(),
    Chapter7View(),
    Chapter8View(),
    Chapter9View(),
    Chapter10View(),
    Chapter11View(),
  ];

  addSkills() {
    setState(() {
      skillList = [
        Languages.of(context)!.activities,
        Languages.of(context)!.glossary,
        Languages.of(context)!.quiz
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    addSkills();
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
                return Container(child: pageList[currentIndex]);
              }),
          currentIndex == 0
              ? Stack(
                  children: [
                    hsized10,
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: Visibility(
                        visible: currentIndex == 0 ? true : false,
                        child: Container(
                          color: MyColor.orange,
                          child: Wrap(
                            children: List.generate(skillList.length, (index) {
                              return InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    CustomNavigators.pushNavigate(ActivityOneView(), context);
                                  }
                                 else if (index == 1) {
                                    CustomNavigators.pushNavigate(SafetyKitchenGlossaryView(), context);
                                    // setState(() {
                                    //   currentIndex = 11;
                                    // });
                                    // _pageController.jumpToPage(currentIndex); // for regular jump
                                  }else if(index == 2){
                                    CustomNavigators.pushNavigate(QuizPage(page:SafetyQuizTimeView(), bgColor:MyColor.orange,), context);
                                  }
                                },
                                child: btnUI(skillList[index], index),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    UiUtils.roundedPage()
                    // Image.asset(AssetsPath.cornerBg,height:120,width:120,),
                  ],
                )
              : SizedBox.shrink()
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
                                    color: currentIndex == i
                                        ? MyColor.appTheme
                                        : currentIndex == 2
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

  btnUI(String title, int index) {
    return Container(
      margin: EdgeInsets.only(right: 18, top: 15),
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      decoration: BoxDecoration(
          color: MyColor.white, borderRadius: BorderRadius.circular(60)),
      child: Text(
        title,
        style: mediumTextStyle(fontSize: 14.0, color: MyColor.black),
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
      currentIndex = value;
    });
  }


}
