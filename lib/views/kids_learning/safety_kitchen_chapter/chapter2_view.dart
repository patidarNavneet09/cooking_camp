import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';

class Chapter2View extends StatefulWidget {
  const Chapter2View({super.key});

  @override
  State<Chapter2View> createState() => _Chapter2ViewState();
}

class _Chapter2ViewState extends State<Chapter2View> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: MyColor.white,

      body: Stack(
        children: [
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
            margin: EdgeInsets.only(top:size.size.height * 0.11),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Cooking Champs always play SAFE in the Kitchen",style:boldTextStyle(fontSize:20.0, color:MyColor.darkOrange),),
                        hsized5,
                        Text("Cooking is fun but we must always remember to be safe in the kitchen. Tools and appliances can be dangerous if we do not handle them properly.",style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
                        hsized10,
                        Text("So first things first!",style:semiBoldTextStyle(fontSize:18.0, color:MyColor.black),),
                        hsized10,
                      ],
                    ),
                  ),
                  Image.asset(AssetsPath.kitchenRules),
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
    );
  }
}
