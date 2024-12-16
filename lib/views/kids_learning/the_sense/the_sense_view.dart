import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/sense_chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/sense_chapter2_view.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/sense_chapter3_view.dart';
import 'package:flutter/material.dart';

int senseCurrentPage = 0;
List<String> skillList = [];
class TheSenseView extends StatefulWidget {
  const TheSenseView({super.key});

  @override
  State<TheSenseView> createState() => _TheSenseViewState();
}


final PageController _pageController = PageController();

class _TheSenseViewState extends State<TheSenseView> {
  List<Widget> pageList = [
    SenseChapter1View(),
    SenseChapter2View(),
    SenseChapter3View(),
    SenseChapter3View(),
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
                color:senseCurrentPage == 0?MyColor.red1:MyColor.white,
                padding: const EdgeInsets.only(top:45.0,left:20,right: 20,bottom: 20),
                child:UiUtils.hygieneAppBar(()=> Navigator.pop(context),text: "The Sense",color: senseCurrentPage == 0?MyColor.white:MyColor.black),
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: pageList.length,
                    controller: _pageController,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, int index) {
                      senseCurrentPage = index;
                      return Container(child: pageList[senseCurrentPage]);
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
                                    color: senseCurrentPage == i
                                        ? MyColor.appTheme
                                        : senseCurrentPage == 2
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
      senseCurrentPage = value;
    });
  }


}
