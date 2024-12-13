import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/go_to_page_number_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';

class HygieneActivity1 extends StatelessWidget {
  const HygieneActivity1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top:30.0,bottom:10,left:20,right:20),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(()=> Navigator.pop(context),color:MyColor.black,text:"Activity 3.1"),

                UiUtils.bookReadGirl(MyColor.green,AssetsPath.bookReadImg)
              ],
            ),
          ),


          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:30.0,bottom:30,left:20,right:20),
                    child: UiUtils.buildBoldText("How many germs can you find? Where are they hiding?",fontSize:20.0,color: MyColor.green),
                  ),

                  hsized10,

                 Padding(
                   padding: const EdgeInsets.only(left:5.0,right:2),
                   child: Image.asset(AssetsPath.hygieneActivity1Img),
                 )
                ],
              ),
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: Padding(padding: EdgeInsets.only(bottom:50,left: 20,right:20),
      child:   GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
              ()=>CustomNavigators.pushNavigate(GoToPageNumberView(text:"Go to page number 199 & Color in the illustration", color:MyColor.darkYellow, appBarTitle:"Acitivity 3.2"),context),
          55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white))),
    );
  }



}
