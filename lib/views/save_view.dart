import 'package:cooking_champs/views/recipe/recipe_list_view.dart';
import 'package:flutter/material.dart';

class SaveView extends StatefulWidget {
  const SaveView({super.key});

  @override
  State<SaveView> createState() => _SaveViewState();
}

class _SaveViewState extends State<SaveView> {
  var favourite = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body: RecipeListView(pageType: 'Favorite',)

      /*Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColor.yellowF6F1E1
            ),
            padding: const EdgeInsets.only(left: 20,right: 20,top:40,bottom:20),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 33,
                        child: Image.asset(AssetsPath.image),
                      ),

                       SizedBox(width:12),

                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Hey, Ronald",
                             style:semiBoldTextStyle(fontSize:18.0, color: MyColor.appTheme)
                           ),

                           Text(
                             "Welcome Back!",
                             style:regularTextStyle(fontSize:16.0, color: MyColor.black)
                           ),
                         ],
                       ),
                    ],
                  ),
                ),

                TouchRippleEffect(
                  borderRadius: BorderRadius.circular(27),
                  rippleColor: Colors.white,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image.asset(height: 42, AssetsPath.bellpng),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  favourite == 0
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
                                        AssetsPath.savetagscr,
                                        height: 45,
                                      ),

                                     hsized10,
                                      Text(
                                        Languages.of(context)!.noSaveRecipeyet,
                                        style: mediumTextStyle(fontSize:14.0, color: MyColor.black)
                                      ),
                                      Text(
                                        Languages.of(context)!.youdonthaveanysaved,
                                        style:regularNormalTextStyle(fontSize:12.0, color: MyColor.black)
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ResponsiveGridRow(
                            children: List.generate(favourite, (index) {
                              return ResponsiveGridCol(
                                  xs: 6,
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
                                                ? MyColor.blueLite // First color
                                                : (index % 6 == 1)
                                                    ? MyColor
                                                        .colorFFFED6 // Second color
                                                    : (index % 6 == 2)
                                                        ? MyColor
                                                            .colorE2EBFF // Third color
                                                        : (index % 6 == 3)
                                                            ? MyColor
                                                                .liteOrange // Fourth color
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
                                                    rippleColor: MyColor.liteGray,
                                                    onTap: () {
                                                      bool check = false;
                                                      for (int i = 0;
                                                          i < saveCheck.length;
                                                          i++) {
                                                        if (!check &&
                                                            saveCheck[i] == true) {
                                                          saveCheck[i] = false;
                                                          favourite--;
                                                          check =
                                                              true; // Exit the loop after the first match
                                                          setState(() {});
                                                        }
                                                      }
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor: MyColor.white,
                                                      child: Image.asset(
                                                        height: 15,
                                                        width: size.width * 0.20,
                                                        AssetsPath.savetag,
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
                                           hsized15,
                                             Text(
                                              "Rainbow peppers",
                                              style:semiBoldTextStyle(fontSize:15.0, color: MyColor.black)
                                            ),
                                           hsized5,
                                            Container(
                                              alignment: Alignment.center,
                                              width: size.width * 0.50,
                                              child: SizedBox(
                                                width: size.width * 0.35,
                                                child:  Text(
                                                  "Salad, Vegetable, Bean Breadcrumbs, Spinach  ",
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: regularNormalTextStyle(fontSize:12.0, color: MyColor.black)
                                                ),
                                              ),
                                            ),

                                             Text(
                                              "More+",
                                              style:regularNormalTextStyle(fontSize:12.0, color: MyColor.black)
                                            ),

                                           hsized15,

                                            const CircleAvatar(
                                              radius: 20,
                                              backgroundColor: MyColor.appTheme,
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
          ),
        ],
      ),*/
    );
  }
}
