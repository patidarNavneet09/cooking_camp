import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_activity2_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../widgets/global_button.dart';

class BasicActivity1View extends StatefulWidget {
  const BasicActivity1View({super.key});

  @override
  State<BasicActivity1View> createState() => _BasicActivity1ViewState();
}

class _BasicActivity1ViewState extends State<BasicActivity1View> {
  // List to hold matching lines as pairs of offsets
  List<Offset> startPoints = [];
  List<Offset> endPoints = [];
  List<MatchTheFollowingModel> rulesList = [];


  Offset? currentStart; // Current starting point of a line
  @override
  void initState() {
    step1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.zero,
        child: AppBar(
          backgroundColor:MyColor.white,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom:70.0,left:15,right:15,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(()=> Navigator.pop(context),text: "Activity 4.1",color:MyColor.black),
                UiUtils.bookReadGirl(MyColor.purple,AssetsPath.bookReadImg)
              ],
            ),

            Text("Matching tools",style: boldTextStyle(fontSize:22.0, color:MyColor.appTheme),),

            Text("Draw a line between the tool and its correct definition.",style: mediumTextStyle(fontSize:16.0, color:MyColor.black),),
            hsized3,
            Container(
              width:300,
              height:3,
              decoration: BoxDecoration(color: MyColor.dividerYellow,),),

            hsized20,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(rulesList.length, (index) {
                            return Row(
                              children: [

                                // Left Side..
                                GestureDetector(
                                  onPanStart: (details) {
                                    setState(() {
                                      currentStart = details.globalPosition;
                                    });
                                  },
                                  onPanEnd: (details) {
                                    setState(() {
                                      currentStart = null;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical:8),
                                    height:75,
                                    width:140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 30),
                                          child: DottedBorder(
                                            radius: Radius.circular(8),
                                            dashPattern: [4,2],
                                            color:MyColor.green ,
                                            borderType: BorderType.RRect,
                                            child: Center(child: Image.asset(rulesList[index].img)),
                                          ),
                                        ),

                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(AssetsPath.dots,color: MyColor.green,))
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(width:20,),

                                // Right Side...
                                Expanded(
                                  child: GestureDetector(
                                    onPanEnd: (details) {
                                      if (currentStart != null) {
                                        setState(() {
                                          startPoints.add(currentStart!);
                                          endPoints.add(details.globalPosition);
                                          currentStart = null;
                                        });
                                      }
                                    },
                                    child:Container(
                                      height:75,
                                      margin: EdgeInsets.symmetric(vertical:8),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 30),
                                            child: DottedBorder(
                                              dashPattern: [4,2],
                                              radius: Radius.circular(20),
                                              strokeCap: StrokeCap.round,
                                              color:MyColor.green ,
                                              child:Container(
                                                  alignment: Alignment.centerLeft,
                                                  padding: EdgeInsets.fromLTRB(30,10,15,10),
                                                  child: Text(rulesList[index].title,style:mediumTextStyle(fontSize:13.0, color:MyColor.black),)),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset(AssetsPath.dots,color: MyColor.green,))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        // Custom painter to draw the lines

                      ],
                    ),
                    hsized30
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet:  Container(
          color: MyColor.white,
          padding: EdgeInsets.only(left:20,right:20,bottom:20,top:0),
          child:GlobalButton(Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme, 55,double.infinity,nextOnTap,55,0,0,mediumTextStyle(fontSize:16.0, color:MyColor.white))
      ),
    );
  }

  void nextOnTap() {
    CustomNavigators.pushNavigate(BasicActivity2View(), context);
  }

  step1(){
    rulesList = [
      MatchTheFollowingModel("Whisk", AssetsPath.whisk),
      MatchTheFollowingModel("Colander", AssetsPath.colander),
      MatchTheFollowingModel("Apron", AssetsPath.apron),
      MatchTheFollowingModel("Tongs", AssetsPath.tongs),
      MatchTheFollowingModel("Pans", AssetsPath.pans),
      MatchTheFollowingModel("Wooden spoon", AssetsPath.woodenSpoon),
    ];
  }


}


class MatchTheFollowingModel{
  String title;
  String img;

  MatchTheFollowingModel(this.title, this.img);
}