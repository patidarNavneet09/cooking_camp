import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';

class Chapter1View extends StatefulWidget {
  const Chapter1View({super.key});

  @override
  State<Chapter1View> createState() => _Chapter1ViewState();
}

class _Chapter1ViewState extends State<Chapter1View> {

  List<String> skillList = [];
  addSkills(){
    setState(() {
      skillList = [Languages.of(context)!.activities,Languages.of(context)!.glossary,Languages.of(context)!.quiz];
    });
  }
  @override
  Widget build(BuildContext context) {
    addSkills();
    final size = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: MyColor.orange,

      body: Stack(
        children: [
          Image.asset(
              AssetsPath.safetyKitchen
          ),
          Padding(
            padding: const EdgeInsets.only(top:55.0,left:20,right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  radius: 80,
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,size:28,),
                ),
                SizedBox(width:10),
                Text("Safety in the kitchen",style:mediumTextStyle(fontSize:18.0, color:MyColor.black),),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:size.size.height * 0.57,left: 20,right: 20),
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Languages.of(context)!.whatInside,style:semiBoldTextStyle(fontSize:20.0, color:MyColor.black),),
                  hsized15,
                  Text(Languages.of(context)!.rhymingRulesForTheCookingChampsKitchen,style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                  hsized10,
                  Text(Languages.of(context)!.cookingChampsKitchenRulesChart,style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),
                  hsized10,
                  Text(Languages.of(context)!.knifeSafetySkillsChart,style:semiBoldTextStyle(fontSize:17.0, color:MyColor.white),),

                  hsized5,

                  Wrap(
                    children:List.generate(3, (index){
                      return InkWell(
                        onTap: (){

                        },
                        child: btnUI("Activities",index),
                      );
                    }),
                  ),

                  hsized30
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(AssetsPath.cornerBg,height: 120,width: 120,))
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton:Image.asset(AssetsPath.cornerBg,height: 108,width: 100,) ,
    );
  }

  btnUI(String title,int index){
    return Container(
      margin: EdgeInsets.only(right: 15,top: 15 ),
      padding: EdgeInsets.symmetric(horizontal:30,vertical: 15),
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(60)
      ),
      child: Text(title,style: mediumTextStyle(fontSize:14.0, color:MyColor.black),),
    );
  }
}
