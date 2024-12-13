import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:flutter/material.dart';

TextEditingController q1Controller = TextEditingController();
TextEditingController q2Controller = TextEditingController();
TextEditingController q3Controller = TextEditingController();
TextEditingController q4Controller = TextEditingController();
TextEditingController q5Controller = TextEditingController();
class HygieneQuizTimeView extends StatefulWidget {
  const HygieneQuizTimeView({super.key});

  @override
  State<HygieneQuizTimeView> createState() => _HygieneQuizTimeViewState();
}

class _HygieneQuizTimeViewState extends State<HygieneQuizTimeView> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Questions
          QuizQuestion(
            questionNumber: "1",
            questionText: "What is Hygiene another word for?",
            controller: q1Controller, maxLine:2,
          ),
          QuizQuestion(
            questionNumber: "2",
            questionText: "Why is it important to wash your hands with soapy water?",
            controller: q2Controller,
          ),

          QuizQuestion(
            questionNumber: "3",
            questionText: "How must you wear your hair when in the kitchen cooking?",
            controller: q3Controller,
          ),

          QuizQuestion(
            questionNumber: "4",
            questionText: "What can germs do?",
            controller: q4Controller,
          ),
        QuizQuestion(
            questionNumber: "5",
            questionText: "What is a germs least favourite TV show?",
             controller: q5Controller,
          ),

        ],

      );
  }
}
