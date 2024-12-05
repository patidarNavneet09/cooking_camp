import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:flutter/material.dart';

class Chapter3View extends StatefulWidget {
  const Chapter3View({super.key});

  @override
  State<Chapter3View> createState() => _Chapter3ViewState();
}

class _Chapter3ViewState extends State<Chapter3View> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);

    return  Scaffold(
      backgroundColor: MyColor.orange,
      body: Stack(
        children: [
          Column(
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
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top:size.size.height * 0.05,left: 20,right: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [

                          Image.asset(AssetsPath.chapter3Img),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:35.0,vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                hsized20,
                                Text("The Cooking Champs Kitchen Rules",textAlign: TextAlign.center,style:boldTextStyle(fontSize:18.0, color:MyColor.darkOrange),),
                                hsized10,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                                  child: Text("Cooking champs are oh so smart!",textAlign: TextAlign.center,style:mediumTextStyle(fontSize:18.0, color:MyColor.appTheme),),
                                ),
                                hsized10,
                                Text("We always ask an adult before we start,",textAlign: TextAlign.center,style:mediumTextStyle(fontSize:18.0, color:MyColor.appTheme),),
                                hsized20,
                                Text("We think those silly people fools Who ignore our important kitchen rules.",textAlign: TextAlign.center,style:mediumTextStyle(fontSize:18.0, color:MyColor.appTheme),),
                                hsized20,
                                Text("So read them carefully and you will see",textAlign: TextAlign.center,style:mediumTextStyle(fontSize:18.0, color:MyColor.appTheme),),
                                hsized10,
                                Text("Because they were invented for you and me!",textAlign: TextAlign.center,style:mediumTextStyle(fontSize:18.0, color:MyColor.appTheme),),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(AssetsPath.cornerBg,height: 120,width: 120,))
        ],
      ),
    );
  }
}
