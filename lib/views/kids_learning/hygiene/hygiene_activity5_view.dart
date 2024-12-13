import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/go_to_page_number_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_activity4_view.dart';
import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';


class HygieneActivity5View extends StatefulWidget {
  const HygieneActivity5View({super.key});

  @override
  State<HygieneActivity5View> createState() => _HygieneActivity5ViewState();
}

class _HygieneActivity5ViewState extends State<HygieneActivity5View> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0,bottom:5,left:20,right:20),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(()=> Navigator.pop(context),color:MyColor.black,text:"Activity 3.3"),

                UiUtils.bookReadGirl(MyColor.green,AssetsPath.bookReadImg)
              ],
            ),
          ),


          Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Column(
                  children: [
                    UiUtils.buildBoldText("Mark or draw them on the hand.",color:MyColor.green,fontSize:23.0),
                    hsized10,
                    UiUtils.buildNormalText("Every time you touch something you can collect different viruses and bacteria, germs. Have a think about all the things you have touched today.",color:MyColor.black,fontSize:16.0),

                    hsized20,
                    Image.asset(AssetsPath.hand),

                    hsized80,

                  ],
                ),))
        ],
      ),
      bottomSheet: Padding(padding: EdgeInsets.only(bottom:50,left: 20,right:20),
          child:   GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                  ()=>CustomNavigators.pushReplacementNavigate(GoToPageNumberView(text: "Go to page number 200-201 & Color in the illustration", color:MyColor.darkYellow, appBarTitle:"Activity 3.6"),context),
              55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white))),
    );
  }
}
