import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_chapter1_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_energy_view.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../dashboard.dart';

class KidsLearningView extends StatefulWidget {
  const KidsLearningView({super.key});

  @override
  State<KidsLearningView> createState() => _KidsLearningViewState();
}

class _KidsLearningViewState extends State<KidsLearningView> {
  bool navigateSafetyKic = false;

  @override
  void initState() {
    super.initState();
    navigateSafetyKic = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          tabCheck = "";
          pageIndex = 0;
        });
        return true;
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      backgroundColor: MyColor.yellowF6F1E1,
      surfaceTintColor: MyColor.yellowF6F1E1,
      title: Row(
        children: [
          InkWell(
            radius: 80,
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              setState(() {
                pageIndex = 0;
                tabCheck = "";
                isTabExplore = false;
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 5.0, right: 10),
              child: Icon(
                Icons.arrow_back_ios,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            Languages.of(context)!.kidsLearning,
            style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
          ),
        ],
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    const colors = [
      MyColor.blueLite,
      MyColor.colorFFFED6,
      MyColor.colorE2EBFF,
      MyColor.liteOrange,
    ];

    const images = [
      AssetsPath.safety,
      AssetsPath.food,
      AssetsPath.food1,
      AssetsPath.safety1,
    ];

    const titles = [
      "Safety in the \nkitchen",
      "Food is Energy",
      "Safety in the \nkitchen",
      "Food is Energy",
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ResponsiveGridRow(
          children: List.generate(4, (index) {
            return ResponsiveGridCol(
              xs: 6,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TouchRippleEffect(
                  borderRadius: BorderRadius.circular(27),
                  rippleColor: Colors.white,
                  onTap: () => _handleTileTap(context,index),
                  child: _buildGridTile(colors[index], images[index], titles[index]),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _handleTileTap(BuildContext context,int index) {
    if (navigateSafetyKic) {
      if(index == 0){
        CustomNavigators.pushNavigate(SafetyKitchenView(), context);
      }else if(index == 1){
        CustomNavigators.pushNavigate(FoodEnergyView(), context);
      }
 /*     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  SafetyKitchenView()),
      ).then((value) => setState(() {
        navigateSafetyKic = true;
      }));*/
    }
  }

  Widget _buildGridTile(Color color, String imagePath, String title) {
    return Stack(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: Fonts.beVietnamProRegular,
              color: MyColor.black,
            ),
          ),
        ),
      ],
    );
  }
}



// import 'package:cooking_champs/constant/assets_path.dart';
// import 'package:cooking_champs/constant/my_color.dart';
// import 'package:cooking_champs/constant/my_fonts_style.dart';
// import 'package:cooking_champs/constant/stringfile.dart/language.dart';
// import 'package:cooking_champs/utils/navigators.dart';
// import 'package:cooking_champs/views/dashboard.dart';
// import 'package:cooking_champs/views/safatykiten1.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_grid/responsive_grid.dart';
// import 'package:touch_ripple_effect/touch_ripple_effect.dart';
//
// class KidsLearningView extends StatefulWidget {
//   const KidsLearningView({super.key});
//
//   @override
//   State<KidsLearningView> createState() => _KidsLearningViewState();
// }
// bool navigateSafetyKic = false;
//
// class _KidsLearningViewState extends State<KidsLearningView> {
//   @override
//   void initState() {
//     super.initState();
//     navigateSafetyKic = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         setState(() {
//           tabCheck = "";
//           pageIndex = 0;
//           // istabExplore = false;
//         });
//       return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leadingWidth: 0,
//           automaticallyImplyLeading: false,
//           backgroundColor: MyColor.yellowF6F1E1,
//           surfaceTintColor: MyColor.yellowF6F1E1,
//           title: Padding(
//             padding: const EdgeInsets.only(left: 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 InkWell(
//                  radius: 80,
//                   borderRadius: BorderRadius.circular(30),
//                   onTap: () {
//                      setState(() {
//                       pageIndex = 0;
//                       tabCheck = "";
//                       isTabExplore = false;
//                     });
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(left:5.0,right:10),
//                     child: const Icon(
//                       Icons.arrow_back_ios,
//                       size:28,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//
//                 Text(
//                   Languages.of(context)!.kidsLearning,
//                   style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
//                 ),
//               ],
//             ),
//           ),
//           centerTitle: true,
//           elevation: 0,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: ResponsiveGridRow(
//                   children: List.generate(4, (index) {
//                     return ResponsiveGridCol(
//                         xs: 6,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 5, right: 5, bottom: 5, top: 10),
//                           child: TouchRippleEffect(
//                             borderRadius: BorderRadius.circular(27),
//                             rippleColor: Colors.white,
//                             onTap: () {
//                               if (navigateSafetyKic == true) {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => SafetykitenScr())).then(
//                                   (value) {
//                                     navigateSafetyKic = true;
//                                   },
//                                 );
//                               }
//
//                               setState(() {});
//                             },
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: 250,
//                                   decoration: BoxDecoration(
//                                       color: (index % 4 == 0)
//                                           ? MyColor.blueLite // First color
//                                           : (index % 4 == 1)
//                                               ? MyColor
//                                                   .colorFFFED6 // Second color
//                                               : (index % 4 == 2)
//                                                   ? MyColor
//                                                       .colorE2EBFF // Third color
//                                                   : (index % 4 == 3)
//                                                       ? MyColor
//                                                           .liteOrange // Fourth color
//                                                       : (index % 4 == 4)
//                                                           ? MyColor
//                                                               .colorE2FFE4 // Fifth color
//                                                           : MyColor.colorFFD6D6,
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(30))),
//                                   child: Image.asset(
//                                     index == 0
//                                         ? AssetsPath.food
//                                         : index == 1
//                                             ? AssetsPath.safety
//                                             : index == 2
//                                                 ? AssetsPath.food1
//                                                 : index == 3
//                                                     ? AssetsPath.safety1
//                                                     : "",
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(15.0),
//                                   child: Text(
//                                     index == 0 || index == 2
//                                         ? "Safety in the \nkitchen"
//                                         : index == 1 || index == 3
//                                             ? "Food is Energy"
//                                             : "",
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: Fonts.beVietnamProRegular,
//                                       color: MyColor.black,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ));
//                   }),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
