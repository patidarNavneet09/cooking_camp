import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/views/kitslearning.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class SafetykitenScr extends StatefulWidget {
  @override
  _SafetykitenScrState createState() => _SafetykitenScrState();
}

int _curr = 0;

class _SafetykitenScrState extends State<SafetykitenScr> {
  PageController controller = PageController();
  final List<Widget> _list = <Widget>[
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateSafetyKic = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _curr == 0 ? MyColor.white : MyColor.white,
      appBar: AppBar(
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        backgroundColor: _curr == 0 ? MyColor.orange : MyColor.white,
        surfaceTintColor: _curr == 0 ? MyColor.orange : MyColor.white,
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
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                Languages.of(context)!.safetyinthekitchen,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: Fonts.beVietnamProRegular,
                  color: MyColor.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        color: _curr == 0 ? MyColor.white : MyColor.white,
        height: 50,
        child: Container(
          color: MyColor.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _list.length; i++)
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
                                    color: _curr == i
                                        ? MyColor.appTheme
                                        : _curr == 2
                                            ? MyColor.blueLite1
                                            : const Color.fromARGB(
                                                255, 219, 217, 217),
                                    width: _curr == i ? 32 : 10),
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
      body: Container(
        color: _curr == 0 ? MyColor.orange : MyColor.white,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    // margin: EdgeInsets.only(bottom: 1),
                    width: size.width,
                    height: size.height * 0.15,
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          AssetsPath.whitesamallroundedback,
                          fit: BoxFit.contain,
                        ),
                      ],
                    )),
              ],
            ),
            PageView(
              scrollDirection: Axis.horizontal,

              // reverse: true,
              physics: BouncingScrollPhysics(),
              controller: controller,

              onPageChanged: (num) {
                _curr = num;
                setState(() {
                  _curr = num;
                });
              },
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AssetsPath.safetyimg),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What’s inside",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.appTheme,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rhyming Rules for the Cooking Champs Kitchen",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Cooking Champs’ Kitchen Rules Chart",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Knife Safety Skills Chart",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: size.width * 0.30,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(33)),
                                child: Center(
                                    child: Text(
                                  "Activity 12",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Fonts.beVietnamProRegular,
                                    color: MyColor.appTheme,
                                  ),
                                )),
                              ),
                              Container(
                                width: size.width * 0.30,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(33)),
                                child: Center(
                                    child: Text(
                                  "Activity 13",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Fonts.beVietnamProRegular,
                                    color: MyColor.appTheme,
                                  ),
                                )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: size.width * 0.30,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(33)),
                                child: Center(
                                    child: Text(
                                  "Quiz 9",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Fonts.beVietnamProRegular,
                                    color: MyColor.appTheme,
                                  ),
                                )),
                              ),
                              Container(
                                width: size.width * 0.30,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(33)),
                                child: Center(
                                    child: Text(
                                  "Quiz 10",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Fonts.beVietnamProRegular,
                                    color: MyColor.appTheme,
                                  ),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Cooking champs always play SAFE in the kitchen",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.beVietnamProRegular,
                            color: MyColor.orange,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Cooking is fun but we must always remember to be safe in the kitchen. Tools and appliances can be dangerous if we do not handle them properly.",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: Fonts.beVietnamProRegular,
                            color: MyColor.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "So first things first!",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: Fonts.beVietnamProRegular,
                            color: MyColor.red,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: size.height * 0.60,
                          width: size.width * 0.90,
                          decoration: BoxDecoration(
                              color: MyColor.yellowF6F1E1,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "The Cooking Champ’s Kitchen Rules",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: Fonts.beVietnamProRegular,
                                            color: MyColor.appTheme,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Just to help you out and make sure cooking is fun The Cooking Champ’s Kitchen Rules are here to keep your time in the kitchen extra safe.",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: Fonts.beVietnamProRegular,
                                        color: MyColor.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Print a copy and put it somewhere where you can see it.",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: Fonts.beVietnamProRegular,
                                        color: MyColor.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "… And don’t forget you must always have an adult present and be extra careful to follow The Cooking Champ Kitchen Rules.",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: Fonts.beVietnamProRegular,
                                        color: MyColor.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset("assets/images/c12-bg 1.png"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 120,
                        // ),
                      ],
                    ),
                  ),
                )
                // new Center(
                //     child: new Pages(
                //   text: "Page 3",
                //   index: _curr,
                // )),
                // new Center(
                //     child: new Pages(
                //   text: "Page 4",
                //   index: _curr,
                // )),
                // new Center(
                //     child: new Pages(
                //   text: "Page 5",
                //   index: _curr,
                // )),
                // new Center(
                //     child: new Pages(
                //   text: "Page 6",
                //   index: _curr,
                // )),
              ],
            ),
          ],
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
}

class Pages extends StatefulWidget {
  final String? text;
  int? index;
  Pages({this.text, this.index});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Stack(
        children: [
          _curr == 0
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AssetsPath.safetyimg),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What’s inside",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.appTheme,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rhyming Rules for the Cooking Champs Kitchen",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Cooking Champs’ Kitchen Rules Chart",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Knife Safety Skills Chart",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cooking champs always play SAFE in the kitchen",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.beVietnamProRegular,
                          color: MyColor.orange,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cooking is fun but we must always remember to be safe in the kitchen. Tools and appliances can be dangerous if we do not handle them properly.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: Fonts.beVietnamProRegular,
                          color: MyColor.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "So first things first!",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: Fonts.beVietnamProRegular,
                          color: MyColor.red,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: size.height * 0.60,
                        width: size.width * 0.90,
                        decoration: BoxDecoration(
                            color: MyColor.yellowF6F1E1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "The Cooking Champ’s Kitchen Rules",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: Fonts.beVietnamProRegular,
                                          color: MyColor.appTheme,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Just to help you out and make sure cooking is fun The Cooking Champ’s Kitchen Rules are here to keep your time in the kitchen extra safe.",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.beVietnamProRegular,
                                      color: MyColor.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Print a copy and put it somewhere where you can see it.",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.beVietnamProRegular,
                                      color: MyColor.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "… And don’t forget you must always have an adult present and be extra careful to follow The Cooking Champ Kitchen Rules.",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.beVietnamProRegular,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset("assets/images/c12-bg 1.png"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 120,
                      // ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
