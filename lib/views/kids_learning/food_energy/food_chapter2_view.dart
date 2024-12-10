import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/activity_one_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/glossary_view.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/quiz_view.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:flutter/material.dart';
class FoodEnergyChapter2View extends StatefulWidget {
  const FoodEnergyChapter2View({super.key});

  @override
  State<FoodEnergyChapter2View> createState() => _FoodEnergyChapter2ViewState();
}

class _FoodEnergyChapter2ViewState extends State<FoodEnergyChapter2View> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top:50.0,bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        radius: 80,
                        onTap: (){
                          setState(() {
                            currentIndex = 0;
                          });
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,size:28,),
                      ),
                      SizedBox(width:10),
                      Text("Food is energy",style:mediumTextStyle(fontSize:18.0, color:MyColor.black),),
                    ],
                  ),
                ),

                Text("Why do we need food?",style:boldTextStyle(fontSize:20.0, color:MyColor.pink),),
                hsized8,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Food is the fuel that keeps us all moving.",style:boldTextStyle(fontSize:16.0, color:MyColor.sky),),
                    hsized2,
                    Container(
                      color: MyColor.sky,
                      width:size.size.width * 0.82,
                      height: 2,
                    )
                  ],
                ),

            hsized10,
                Text("Our body changes the food to nutrients and that makes energy Our body needs food to grow and do all the jobs you have to do during the day.",style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),

              ],
            ),
          ),


          hsized20,
          Image.asset(AssetsPath.foodEnergyImg2),




        ],
      ),
    );
  }

  btnUI(String title,int index){
    return Container(
      margin: EdgeInsets.only(right:15,top:15 ),
      padding: EdgeInsets.symmetric(horizontal:30,vertical:15),
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(60)
      ),
      child: Text(title,style: mediumTextStyle(fontSize:14.0, color:MyColor.pink),),
    );
  }

}
