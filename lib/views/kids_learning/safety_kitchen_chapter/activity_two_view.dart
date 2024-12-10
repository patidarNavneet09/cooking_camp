import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

import '../../../widgets/global_button.dart';

class ActivityTwoView extends StatefulWidget {
  const ActivityTwoView({super.key});

  @override
  State<ActivityTwoView> createState() => _ActivityTwoViewState();
}

class _ActivityTwoViewState extends State<ActivityTwoView> {
  // List to hold matching lines as pairs of offsets
  List<Offset> startPoints = [];
  List<Offset> endPoints = [];
  List<MatchTheFollowingModel> rulesList = [];

  String topStep = "1.2";
  String step = "1/2";

  Offset? currentStart; // Current starting point of a line
  @override
  void initState() {
    setRulesList();
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
        padding: const EdgeInsets.only(bottom:75.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left:15,right:15,top:0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(step == "1/2"){
                              CustomNavigators.popNavigate(context);
                            }else if(step == "2/2"){
                              step = "1/2";
                            }else if(topStep  == "1.3"){
                              step = "2/2";
                              topStep = "1.2";
                            }else{
                              CustomNavigators.popNavigate(context);
                            }
                          });


                        },
                        child: Icon(Icons.arrow_back_ios,color: MyColor.black,size:28,),
                      ),
                      Text("${Languages.of(context)!.activity}$topStep",style:mediumTextStyle(fontSize:18.0, color:MyColor.black),)
                    ],
                  ),

                  Image.asset(AssetsPath.activityTopImg,height: 105,width:120)
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Matching chart with The Cooking Champ Kitchen Rules",style: boldTextStyle(fontSize:22.0, color:MyColor.darkOrange),),
            ),

            hsized10,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Match the Rule with the picture",style: mediumTextStyle(fontSize:16.0, color:MyColor.black),),
                        hsized3,
                        Container(width:265,
                          height:3,
                          decoration: BoxDecoration(color: MyColor.dividerYellow,),)
                      ],
                    ),
                  ),
                  Text(step,style: mediumTextStyle(fontSize:16.0, color:MyColor.black),),
                ],
              ),
            ),

            hsized20,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Stack(
                      children: [
                        // CustomPaint(
                        //   painter: LinePainter(startPoints: startPoints, endPoints: endPoints),
                        //   child: Container(),
                        // ),
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
                                    height:100,
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
                                            color:MyColor.orange ,
                                            borderType: BorderType.RRect,
                                            child: Center(child: Image.asset(rulesList[index].img)),
                                          ),
                                        ),
                                        
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(AssetsPath.dots,color: MyColor.darkOrange,))
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
                                      height:100,
                                      margin: EdgeInsets.symmetric(vertical:8),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 30),
                                            child: DottedBorder(
                                              dashPattern: [4,2],
                                            radius: Radius.circular(20),
                                              strokeCap: StrokeCap.round,
                                              color:MyColor.orange ,
                                              child:Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                                                  child: Text(rulesList[index].title,style:mediumTextStyle(fontSize:13.0, color:MyColor.black),)),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset(AssetsPath.dots,color: MyColor.darkOrange,))
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
          child:GlobalButton(step == "1/2"?Languages.of(context)!.next:Languages.of(context)!.submit,MyColor.appTheme,MyColor.appTheme, 55,double.infinity,nextOnTap,55,0,0,mediumTextStyle(fontSize:16.0, color:MyColor.white))
      ),
    );
  }

  void nextOnTap() {
    if(mounted){
      if(step == "1/2"){
        setState(() {
          rulesList.clear();
          step = "2/2";
          step2();
        });
      }else if(step == "2/2"){
        setState(() {
          topStep = "1.3";
          step = "";
          rulesList.clear();
          step3();
        });
      }else if(topStep == "1.3"){
        CustomNavigators.popNavigate(context);
      }
    }
  }
  step2(){
    rulesList = [MatchTheFollowingModel("Only use your cooking champ knife and peeler", AssetsPath.img3),
      MatchTheFollowingModel("Stay clean: wash your hands, hair tied up and apron on", AssetsPath.img9),
      MatchTheFollowingModel("Keep electrical cords away from stove top", AssetsPath.img12),
      MatchTheFollowingModel("If something goes wrong call an adult", AssetsPath.img10),
      MatchTheFollowingModel("Keep appliances away from water", AssetsPath.img6),
      MatchTheFollowingModel("Keep cleaning products and food separate", AssetsPath.img11),
    ];
  }
  step3(){
    rulesList = [MatchTheFollowingModel("Always carry knives by the handle pointing down", AssetsPath.img3),
      MatchTheFollowingModel("Always use a chopping board", AssetsPath.img9),
      MatchTheFollowingModel("If a knife falls DON’T try to catch it", AssetsPath.img12),
      MatchTheFollowingModel("Do not put knives into a sink with soapy water", AssetsPath.img10),
      MatchTheFollowingModel("Always keep finger tips tucked under while cutting or chopping", AssetsPath.img6),
      MatchTheFollowingModel("Always cut away from fingers", AssetsPath.img11),
    ];
  }

  void setRulesList() {
    rulesList = [MatchTheFollowingModel("Always follow the knife safety rules!", AssetsPath.img1),
      MatchTheFollowingModel("Ask an adult before you start cooking and only use the stove when you are with an adult", AssetsPath.activityImg2),
      MatchTheFollowingModel("Don't play or run in the kitchen", AssetsPath.img8),
      MatchTheFollowingModel("Make sure pot and pan handles are turned in", AssetsPath.img2),
      MatchTheFollowingModel("Keep paper towels and tea towels away from stove tops", AssetsPath.img4),
      MatchTheFollowingModel("Keep your kitchen clean and clean spills immediately", AssetsPath.img7),
    ];
    setState(() {});
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> startPoints;
  final List<Offset> endPoints;

  LinePainter(this.startPoints, this.endPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < startPoints.length; i++) {
      canvas.drawLine(startPoints[i], endPoints[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class MatchTheFollowingModel{
  String title;
  String img;

  MatchTheFollowingModel(this.title, this.img);
}