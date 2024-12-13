import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_activity3_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygine_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class GoToPageNumberView extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
 final String appBarTitle;
  const GoToPageNumberView({super.key,required this.text,required this.color,required this.appBarTitle,this.textColor = MyColor.green});

  @override
  State<GoToPageNumberView> createState() => _GoToPageNumberViewState();
}

class _GoToPageNumberViewState extends State<GoToPageNumberView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0,bottom:20,left:20,right:20),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(()=> Navigator.pop(context),color:MyColor.black,text:widget.appBarTitle),

                UiUtils.bookReadGirl(widget.color,AssetsPath.readBookBoy)
              ],
            ),
          ),


          Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Column(
            children: [
            UiUtils.buildBoldText(widget.text,color:MyColor.green,fontSize:23.0)
            ],
          ),))
        ],
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.only(bottom:50,left: 20,right:20),
          child:   GlobalButton(widget.appBarTitle == "Activity 3.6"?Languages.of(context)!.submit:Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                  (){
            if(widget.appBarTitle == "Activity 3.6"){
              setState(() {
                hygieneCurrentPage = 0;
              });

              CustomNavigators.pushReplacementNavigate(AllAboutHygieneView(),context);
            }else{
              CustomNavigators.pushNavigate(HygieneActivity3View(),context);
            }
                  },
              55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white))),
    );
  }
}
