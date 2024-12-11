import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:flutter/material.dart';

class FoodChapter5View extends StatefulWidget {
  const FoodChapter5View({super.key});

  @override
  State<FoodChapter5View> createState() => _FoodChapter5ViewState();
}

class _FoodChapter5ViewState extends State<FoodChapter5View> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColor.colorFFD6D6,
      body:Align(
        alignment: Alignment.center,
        child: Container(
          width:356,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsPath.foodChapter5Bg))
          ),
          padding: EdgeInsets.only(left:20,right:20,top: 10,bottom:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("The answer?", textAlign: TextAlign.center,style:boldTextStyle(fontSize:25.0, color:MyColor.pink),),
              Text("What the Cooking Champs’ say!", textAlign: TextAlign.center,style:semiBoldTextStyle(fontSize:15.0, color:MyColor.black),),
              Container(
                  width:300,
                  alignment: Alignment.center,
                  child: Text("To remove plaque and stop decay Brush your teeth twice every day. In the morning before you go to school And every night will keep you looking oh so cool!",textAlign: TextAlign.center,style:semiBoldTextStyle(fontSize:15.0, color:MyColor.appTheme),)),

             hsized10,

              Image.asset(AssetsPath.foodChapter5Img1,height:205,),

              Container(
                  width:300,
                  alignment: Alignment.center,
                  child: Text("Floss daily to remove plaque from between your teeth. and under your gumline, where your toothbrush may not reach.",textAlign: TextAlign.center,style:semiBoldTextStyle(fontSize:15.0, color:MyColor.appTheme),)),


              hsized10,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'SAY NO! ',
                  style:boldTextStyle(fontSize:14.50, color:MyColor.red1),
                  children: <TextSpan>[
                     TextSpan(
                        text: 'to too many sugary and starchy foods, like lollies and sticky jubes AND pleeease Go to the dentist don’t be slack! Make sure you keep those teeth in tact!!',
                        style: boldTextStyle(fontSize:14.30, color:MyColor.appTheme),),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
