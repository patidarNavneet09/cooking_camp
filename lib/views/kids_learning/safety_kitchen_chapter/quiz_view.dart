import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';


// Widget for displaying a question and input field
class QuizQuestion extends StatelessWidget {
  final String questionNumber;
  final String questionText;

  const QuizQuestion({super.key, required this.questionNumber, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$questionNumber. $questionText",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          textField(),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  textField(){
    return Stack(
      children: [
        for (int i = 0; i < 2; i++)
          Container(
            margin: EdgeInsets.only(
              top: 4 + (i + 1) * 28,
            ),
            decoration: const BoxDecoration(
              border: DashedBorder(
                dashLength: 5,
                left: BorderSide.none,
                top: BorderSide.none,
                right: BorderSide.none,
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
         SizedBox(
          height: 97,
          child: TextField(
            scrollPhysics: NeverScrollableScrollPhysics(),
            decoration: InputDecoration(border: InputBorder.none),
            cursorHeight: 22,
            onTapOutside: (v){
              FocusManager.instance.primaryFocus!.unfocus();
            },
            style: TextStyle(
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.multiline,
            expands: true,
            maxLines: null,
          ),
        ),
      ],
    );
  }
}


class QuizPage extends StatefulWidget {
  final Widget page;
  final Color bgColor;
  const QuizPage({super.key,required this.page,required this.bgColor});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    final size  =MediaQuery.of(context);
    return Scaffold(
        backgroundColor:widget.bgColor,
        appBar: PreferredSize(
          preferredSize:Size.zero,
          child: AppBar(
            backgroundColor:widget.bgColor,
            automaticallyImplyLeading: false,
          ),
        ),
      body: Container(
        margin: EdgeInsets.only(bottom:90),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left:8,right:8,bottom:22),
              margin: EdgeInsets.only(top:30),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: CustomPaint(
                      painter: ExactCurvePainter(),
                      child:  Container(
                        margin: EdgeInsets.only(top:60,bottom:size.size.height * 0.2),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal:25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Row(
                                  children: [
                                    Text(
                                      "Quiz time!",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange.shade800,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.school, color: Colors.amber, size: 32),
                                    Icon(Icons.cloud, color: Colors.blue.shade400, size: 32),
                                  ],
                                ),
                                SizedBox(height: 12),

                                widget.page,
                                //FoodQuizTimeView(),

                                hsized45
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Align(
                alignment: Alignment.topRight,
                child: Image.asset(AssetsPath.twoEmoji,height: 113,width: 157,)),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(AssetsPath.girlBoyBottomImg)),
          ],
        ),
      ),
      //floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      bottomSheet:  Container(
        color:widget.bgColor,
          padding: EdgeInsets.only(left:20,right:20,bottom:20,top: 0),
          child:GlobalButton(Languages.of(context)!.submit,MyColor.appTheme,MyColor.appTheme, 55,double.infinity,submitOnTap,55,0,0,mediumTextStyle(fontSize:16.0, color:MyColor.white))
      ),
    );
  }

  void submitOnTap() {
    Navigator.pop(context);
  }


}

class ExactCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white // White background
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start at top left corner
    path.moveTo(size.height * 0.0, size.height * 0.10);

    // Top edge with wavy curve
    path.quadraticBezierTo(
        size.width * 0.01, 0, size.width * 0.2, size.height * 0.04);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.06, size.width * 0.7, size.height * 0.02);
    path.quadraticBezierTo(size.width * 0.9, 0, size.width, size.height * 0.06);

    // Right side
    path.lineTo(size.width, size.height * 0.95);

    // Bottom edge with wavy curve
    path.quadraticBezierTo(
        size.width * 0.9, size.height, size.width * 0.8, size.height * 0.98);
    path.quadraticBezierTo(
        size.width * 0.4, size.height * 0.95, size.width * 0.2, size.height * 0.98);
    path.quadraticBezierTo(
        size.width * 0, size.height, 0, size.height * 0.95);

    // Close the path (left side)
    path.lineTo(0, size.height * 0.05);

    // Draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}