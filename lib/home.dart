import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/cookdetails.dart';
import 'package:cooking_champs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  List explorelist = [
    "Kids Learning",
    "Our Stories",
    "About Us",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: MyColor.yellowF6F1E1,
        toolbarHeight: 108,
        backgroundColor: MyColor.yellowF6F1E1,
        leadingWidth: size.width * 0.80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 33,
                child: Image.asset(ImageAsset.image),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey, Ronald",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: Fonts.vietna,
                        color: MyColor.blue,
                      ),
                    ),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: Fonts.vietna,
                        color: MyColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TouchRippleEffect(
            borderRadius: BorderRadius.circular(27),
            rippleColor: Colors.white,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(height: 42, ImageAsset.bellpng),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              width: size.width,
              padding: const EdgeInsets.only(left: 5, top: 5),
              // color: Colors.amber,
              alignment: Alignment.center,
              child: ListView.builder(
                  itemCount: explorelist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(08.0),
                        child: TouchRippleEffect(
                          borderRadius: BorderRadius.circular(5),
                          rippleColor: Colors.white,
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => DashBoardScr(
                                        pageIndex: 4,
                                        tabcheck: index == 0
                                            ? "kids"
                                            : index == 1
                                                ? "OurStories"
                                                : index == 2
                                                    ? "about"
                                                    : "",
                                      )),
                            );

                            istabExplore = true;
                            setState(() {});
                          },
                          child: Container(
                            height: 41,
                            // width: 100,
                            decoration: const BoxDecoration(
                                color: MyColor.liteyellowbottom,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 22),
                              child: Center(
                                child: Text(
                                  explorelist[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Fonts.vietna,
                                    color: MyColor.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: explorelist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 11.0, bottom: 0.0, left: 11.0, right: 11.0),
                      child: TouchRippleEffect(
                        borderRadius: BorderRadius.circular(27),
                        rippleColor: Colors.white,
                        onTap: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                              color: MyColor.colorE0FFC6,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          height: 165,
                          width: size.width * 0.94,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 165,
                                    width: size.width * 0.60,
                                    decoration: const BoxDecoration(
                                        // color: MyColor.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 21, right: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 45,
                                          ),
                                          const Text(
                                            "Rainbow Veggie Wraps",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          const Text(
                                            "Salad, Vegetable, Bean, More+",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                            width: size.width * 0.27,
                                            height: 30,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        MyColor.blue,
                                                    // surfaceTintColor: MyColor.white,
                                                    overlayColor:
                                                        MyColor.liteyellow,
                                                    enableFeedback: true,
                                                    enabledMouseCursor:
                                                        MouseCursor.defer,
                                                    // Background color
                                                    // Text color (alternative)
                                                    elevation:
                                                        5, // Optional: elevation (shadow)
                                                    // Custom padding
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10), // Custom shape
                                                    ),
                                                    padding: EdgeInsets.zero),
                                                onPressed: () {
                                                  // Navigator.of(context).pushAndRemoveUntil(
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             const Loginscr()),
                                                  //     (Route<dynamic> route) => false);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      Language()
                                                          .viewDetailsarrow
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            Fonts.vietna,
                                                        color: MyColor.white,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                          decoration: const BoxDecoration(
                                              // color: MyColor.red,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  bottomRight:
                                                      Radius.circular(27))),
                                          // height: 162,
                                          // width: size.width * 0.335,
                                          child: Image.asset(
                                            height: 130,
                                            width: size.width * 0.30,
                                            ImageAsset.image173,
                                            fit: BoxFit.fitWidth,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: MyColor.yello,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(27),
                                        bottomRight: Radius.circular(27))),
                                height: 41,
                                width: size.width * 0.50,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 21, top: 10),
                                  child: Text(
                                    "Recipe of the Week",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, bottom: 0, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Language().popularRecipe,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.vietna,
                            color: MyColor.black,
                          ),
                        ),
                        InkWell(
                          radius: 50,
                          onTap: () {
                            debugPrint("dfdfd");
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const DashBoardScr(
                                          pageIndex: 1,
                                        )),
                                (Route<dynamic> route) => false);
                            setState(() {});
                          },
                          child: Text(
                            Language().seeall,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.vietna,
                              color: MyColor.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    // width: size.width,
                    // padding: const EdgeInsets.only(top: 5),
                    margin: const EdgeInsets.only(bottom: 0),
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 5, top: 10),
                            child: TouchRippleEffect(
                              // focusColor: Colors.amber,
                              // splashColor: Colors.blue,
                              // hoverColor: Colors.red,
                              // highlightColor: Colors.pink,

                              borderRadius: BorderRadius.circular(30),
                              rippleColor: Colors.white,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CookDetailsScr(
                                            name: "Rainbow peppers",
                                          )),
                                );
                              },
                              child: Container(
                                height: 290,
                                width: size.width * 0.46,
                                decoration: BoxDecoration(
                                    color: (index % 6 == 0)
                                        ? MyColor.bluelite // First color
                                        : (index % 6 == 1)
                                            ? MyColor
                                                .colorFFFED6 // Second color
                                            : (index % 6 == 2)
                                                ? MyColor
                                                    .colorE2EBFF // Third color
                                                : (index % 6 == 3)
                                                    ? MyColor
                                                        .liteyellow // Fourth color
                                                    : (index % 6 == 4)
                                                        ? MyColor
                                                            .colorE2FFE4 // Fifth color
                                                        : MyColor.colorFFD6D6,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       top: 10, right: 10),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.end,
                                    //     children: [
                                    //       InkWell(
                                    //         radius: 50,
                                    //         onTap: () {
                                    //           if (savecheck[index] == false) {
                                    //             savecheck[index] = true;
                                    //             setState(() {});
                                    //           } else {
                                    //             savecheck[index] = false;
                                    //             setState(() {});
                                    //           }
                                    //         },
                                    //         child: CircleAvatar(
                                    //           backgroundColor: MyColor.white,
                                    //           child: Image.asset(
                                    //             height: 15,
                                    //             width: size.width * 0.20,
                                    //             ImageAsset.savetag,
                                    //             color: savecheck[index] == true
                                    //                 ? MyColor.red
                                    //                 : null,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Image.asset(
                                        height: 80,
                                        width: size.width * 0.30,
                                        "assets/images/delicious-salad-studio 1.png"),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Rainbow peppers",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: Fonts.vietna,
                                        color: MyColor.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      // color: MyColor.red,
                                      width: size.width * 0.50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            // color: MyColor.yello,
                                            width: size.width * 0.35,
                                            child: const Text(
                                              "Salad, Vegetable, Bean Breadcrumbs, Spinach  ",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: Fonts.vietna,
                                                color: MyColor.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "More+",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: Fonts.vietna,
                                        color: MyColor.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: MyColor.blue,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: MyColor.white,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Language().featuredstories,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.vietna,
                            color: MyColor.black,
                          ),
                        ),
                        Text(
                          Language().seeall,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.vietna,
                            color: MyColor.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    margin: const EdgeInsets.only(bottom: 10),
                    // width: size.width,
                    // padding: const EdgeInsets.only(top: 5),
                    // color: Colors.amber,
                    alignment: Alignment.center,

                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 5, top: 10),
                            child: TouchRippleEffect(
                              borderRadius: BorderRadius.circular(10),
                              rippleColor: Colors.white,
                              onTap: () {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: MyColor.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: size.width * 0.46,
                                height: 250,
                                child: Column(
                                  children: [
                                    Image.asset(
                                        width: size.width * 0.52,
                                        ImageAsset.demo1),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Lorem Ipsum ",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Lorem Ipsum is simply dummy text of the and typesetting.. ",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
