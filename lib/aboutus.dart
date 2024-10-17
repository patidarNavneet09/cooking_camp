import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AboutUsScr extends StatefulWidget {
  const AboutUsScr({super.key});

  @override
  State<AboutUsScr> createState() => _AboutUsScrState();
}

class _AboutUsScrState extends State<AboutUsScr> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                Language().aboutUs,
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
                          onTap: () {},
                          child: Container(
                            height: 270,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: (index % 6 == 0)
                                    ? MyColor.bluelite // First color
                                    : (index % 6 == 1)
                                        ? MyColor.liteyellow // Second color
                                        : (index % 6 == 2)
                                            ? MyColor.colorFFFED6 // Third color
                                            : (index % 6 == 3)
                                                ? MyColor
                                                    .colorE2FFE4 // Fourth color
                                                : (index % 6 == 4)
                                                    ? MyColor
                                                        .colorE2FFE4 // Fifth color
                                                    : MyColor.colorFFD6D6,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                // Image.asset(
                                //     height: 80,
                                //     width: size.width * 0.30,
                                //     "assets/images/delicious-salad-studio 1.png"),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: MyColor.white,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage((index % 4 == 0)
                                        ? ImageAsset.ellipse16 // First color
                                        : (index % 4 == 1)
                                            ? ImageAsset
                                                .ellipse17 // Second color
                                            : (index % 4 == 2)
                                                ? ImageAsset
                                                    .ellipse18 // Third color
                                                : (index % 4 == 3)
                                                    ? ImageAsset.ellipse19
                                                    : ImageAsset.ellipse16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        (index % 4 == 0)
                                            ? Language()
                                                .introductiontoCookingChamps // First color
                                            : (index % 4 == 1)
                                                ? Language()
                                                    .messageforParents // Second color
                                                : (index % 4 == 2)
                                                    ? Language()
                                                        .messagetoCookingChamps // Third color
                                                    : (index % 4 == 3)
                                                        ? Language()
                                                            .cookingChampsMoto
                                                        : "",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: Fonts.vietna,
                                          color: MyColor.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
