import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/quiz_view.dart';
import 'package:flutter/material.dart';

class FoodQuizTimeView extends StatefulWidget {
  const FoodQuizTimeView({super.key});

  @override
  State<FoodQuizTimeView> createState() => _FoodQuizTimeViewState();
}

class _FoodQuizTimeViewState extends State<FoodQuizTimeView> {
  @override
  Widget build(BuildContext context) {
    return
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Questions
          QuizQuestion(
            questionNumber: "1",
            questionText: "Why do we need food?",
          ),
          QuizQuestion(
            questionNumber: "2",
            questionText: "What should we eat every day?",
          ),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiUtils.buildMediumText("3. We should eat fast food",fonSize:15.0),
              Wrap(
                children: [
                  answerUI("a) every day?"),
                  answerUI("b) occasionally"),
                  answerUI("c) weekly"),
                ],
              )
            ],
          ),

          hsized30,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiUtils.buildMediumText("4. Our body needs food to:",fonSize:15.0),
              Wrap(
                children: [
                  answerUI("a) stay alive	"),
                  answerUI("b) sleep"),
                  answerUI("c) run"),
                  answerUI("c) all of the above"),
                ],
              )
            ],
          ),
          hsized30,
          QuizQuestion(
            questionNumber: "5",
            questionText:
            "Nutrients are locked inside the food we eat? True or False?",
          ),

          QuizQuestion(
            questionNumber: "6",
            questionText:
            "We get energy from the sun? True or False?",
          ),

        ],

       );
  }
  answerUI(String text){
    return Container(
        padding: EdgeInsets.only(right: 20,top:8,bottom: 5),
        child: UiUtils.buildRegularText(text,fonSize:14.0));
  }
}
