import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/dashboard.dart';
import 'package:cooking_champs/safatykiten.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class KitsLearningScr extends StatefulWidget {
  const KitsLearningScr({super.key});

  @override
  State<KitsLearningScr> createState() => _KitsLearningScrState();
}

class _KitsLearningScrState extends State<KitsLearningScr> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint("dfsdfsdf");
        // istabExplore = false;
        setState(() {});
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const DashBoardScr(
                      pageIndex: 0,
                      tabcheck: "",
                    )),
            (Route<dynamic> route) => false);
        setState(() {});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: MyColor.yellowF6F1E1,
          surfaceTintColor: MyColor.yellowF6F1E1,
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TouchRippleEffect(
                  // focusColor: Colors.amber,
                  // splashColor: Colors.blue,
                  // hoverColor: Colors.red,
                  // highlightColor: Colors.pink,

                  borderRadius: BorderRadius.circular(30),
                  rippleColor: Colors.white,
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const DashBoardScr(
                                pageIndex: 0,
                              )),
                    );
                    istabExplore = false;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  Language().kidsLearning,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: Fonts.vietna,
                    color: MyColor.black,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ResponsiveGridRow(
                  children: List.generate(4, (index) {
                    return ResponsiveGridCol(
                        xs: 6,
                        // md: 8,
                        // lg: 10,
                        // sm: 10,
                        // xl: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 5, top: 10),
                          child: TouchRippleEffect(
                            borderRadius: BorderRadius.circular(27),
                            rippleColor: Colors.white,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SafetykitenScr()));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: (index % 4 == 0)
                                          ? MyColor.bluelite // First color
                                          : (index % 4 == 1)
                                              ? MyColor
                                                  .colorFFFED6 // Second color
                                              : (index % 4 == 2)
                                                  ? MyColor
                                                      .colorE2EBFF // Third color
                                                  : (index % 4 == 3)
                                                      ? MyColor
                                                          .liteyellow // Fourth color
                                                      : (index % 4 == 4)
                                                          ? MyColor
                                                              .colorE2FFE4 // Fifth color
                                                          : MyColor.colorFFD6D6,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Image.asset(
                                    index == 0
                                        ? ImageAsset.food
                                        : index == 1
                                            ? ImageAsset.safety
                                            : index == 2
                                                ? ImageAsset.food1
                                                : index == 3
                                                    ? ImageAsset.safety1
                                                    : "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    index == 0 || index == 2
                                        ? "Safety in the \nkitchen"
                                        : index == 1 || index == 3
                                            ? "Food is Energy"
                                            : "",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
