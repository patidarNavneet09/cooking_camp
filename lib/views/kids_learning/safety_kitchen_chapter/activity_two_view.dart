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
  late ScribbleNotifier notifier;
  // Example data for left and right images
  final List<String> leftImages = [
    AssetsPath.img1,
  AssetsPath.img1,
    AssetsPath.img1,
    AssetsPath.img1,
    AssetsPath.img1,
    AssetsPath.img1
  ];

  final List<String> rightImages = [
    "Always follow the knife safety rules!",
        "Ask an adult before you start cooking and only use the stove when you are with an adult",
        "Don't play or run in the kitchen",
    "Make sure pot and pan handles are turned in",
    "Keep paper towels and tea towels away from stove tops",
    "Keep your kitchen clean and clean spills immediately"
  ];

  // List to hold matching lines as pairs of offsets
  List<Offset> startPoints = [];
  List<Offset> endPoints = [];

  Offset? currentStart; // Current starting point of a line
  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.zero,
        child: AppBar(),
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
                          CustomNavigators.popNavigate(context);
                        },
                        child: Icon(Icons.arrow_back_ios,color: MyColor.black,size:28,),
                      ),
                      Text("${Languages.of(context)!.activity}1.2",style:mediumTextStyle(fontSize:18.0, color:MyColor.black),)
                    ],
                  ),

                  Image.asset(AssetsPath.activityTopImg,height: 125,width:120)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Matching chart with The Cooking Champ Kitchen Rules",style: boldTextStyle(fontSize:23.0, color:MyColor.darkOrange),),
                    hsized10,
                    Row(
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
                        Text("1/2",style: mediumTextStyle(fontSize:16.0, color:MyColor.black),),
                      ],
                    ),
                    hsized20,
                    Stack(
                      children: [
                        CustomPaint(
                          painter: LinePainter(startPoints: startPoints, endPoints: endPoints),
                          child: Container(),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(rightImages.length, (index) {
                            return Row(
                              children: [
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
                                    width:100,
                                    child: DottedBorder(
                                      dashPattern: [4,2],
                                      color:MyColor.orange ,
                                      child: Image.asset(leftImages[index]),
                                    ),
                                  ),
                                ),
                                SizedBox(width:70,),
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
                                      child: DottedBorder(
                                        dashPattern: [4,2],
                                      radius: Radius.circular(20),
                                        strokeCap: StrokeCap.round,
                                        color:MyColor.orange ,
                                        child:Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.fromLTRB(15,10,15,10),
                                            child: Text(rightImages[index])),
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
          child:GlobalButton(Languages.of(context)!.submit,MyColor.appTheme,MyColor.appTheme, 55,double.infinity,nextOnTap,55,0,0,mediumTextStyle(fontSize:16.0, color:MyColor.white))
      ),
    );
  }

  void nextOnTap() {
  }
}

// Custom Painter to draw lines
class LinePainter extends CustomPainter {
  final List<Offset> startPoints;
  final List<Offset> endPoints;

  LinePainter({required this.startPoints, required this.endPoints});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < startPoints.length; i++) {
      canvas.drawLine(startPoints[i], endPoints[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


