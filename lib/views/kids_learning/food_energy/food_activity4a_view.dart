import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_activity7_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class FoodActivity4AView extends StatelessWidget {
  const FoodActivity4AView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils().foodEnergyAppBar(() => Navigator.pop(context),
                    text: "Activity 2.4- A"),
                UiUtils.bookReadGirl(MyColor.pink, AssetsPath.bookReadImg)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        UiUtils.buildBoldText("I brushed my teeth", fontSize: 23.0, color: MyColor.pink),

                        hsized5,
                        UiUtils.buildNormalText(
                          "At home keep a record of you teeth brushing. Tick the morning and night boxes after you have brushed your teeth. At the end of the week ask your guardian to witness the activity and bring to school the following Monday to discuss with your class.",
                          color: MyColor.black,
                        ),


                        hsized20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            UiUtils.buildBoldText("Morning"),
                            SizedBox(width:50,),
                            UiUtils.buildBoldText("Night"),
                            SizedBox(width:10,),
                          ],
                        ),
                        hsized10,
                        Image.asset(AssetsPath.foodActivity4AImg),
                        hsized20,
                        Container(
                          width: double.infinity,
                          color: MyColor.grayLite1,
                          height: 2,
                        ),
                        hsized10,
                        UiUtils.buildRegularText("Witness signature",),
                        hsized80,
                      ],
                    ),
                  ),
                  hsized20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                            ()=>  CustomNavigators.pushNavigate(FoodActivity7View(), context),
                        55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)),
                  ),
                  hsized50,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




}
