import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/recipe.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class SaveScr extends StatefulWidget {
  const SaveScr({super.key});

  @override
  State<SaveScr> createState() => _SaveScrState();
}

class _SaveScrState extends State<SaveScr> {
  var countlistsave = 0;
  @override
  void initState() {
    super.initState();
    data();
  }

  var j = 1;
  data() {
    for (int i = 0; i < savecheck.length; i++) {
      if (savecheck[i] == true) {
        countlistsave = j++;
        setState(() {});
      }
    }
  }

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
            countlistsave == 0
                ? SizedBox(
                    height: size.height * 0.60,
                    child: Center(
                      child: Container(
                          width: size.width * 0.80,
                          height: 135,
                          decoration: const BoxDecoration(
                              color: MyColor.yellowF6F1E1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  ImageAsset.savetagscr,
                                  height: 45,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  Language().noSaveRecipeyet,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Fonts.vietna,
                                    color: MyColor.black,
                                  ),
                                ),
                                Text(
                                  Language().youdonthaveanysaved,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: Fonts.vietna,
                                    color: MyColor.black,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ResponsiveGridRow(
                      children: List.generate(countlistsave, (index) {
                        return ResponsiveGridCol(
                            xs: 6,
                            // md: 8,
                            // lg: 10,
                            // sm: 10,
                            // xl: 10,
                            child: TouchRippleEffect(
                              borderRadius: BorderRadius.circular(27),
                              rippleColor: Colors.white,
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5, top: 10),
                                child: Container(
                                  height: 300,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TouchRippleEffect(
                                              borderRadius:
                                                  BorderRadius.circular(27),
                                              rippleColor: MyColor.litegray,
                                              onTap: () {
                                                bool check = false;
                                                for (int i = 0;
                                                    i < savecheck.length;
                                                    i++) {
                                                  if (!check &&
                                                      savecheck[i] == true) {
                                                    savecheck[i] = false;
                                                    countlistsave--;
                                                    check =
                                                        true; // Exit the loop after the first match
                                                    setState(() {});
                                                  }
                                                }

                                                // if (!check) {
                                                //   // No true value was found, so add true to the list
                                                //   savecheck.add(true);
                                                //   countlistsave++;
                                                //   setState(() {});
                                                // }
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: MyColor.white,
                                                child: Image.asset(
                                                  height: 15,
                                                  width: size.width * 0.20,
                                                  ImageAsset.savetag,
                                                  color: MyColor.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                        height: 15,
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
                            ));
                      }),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
