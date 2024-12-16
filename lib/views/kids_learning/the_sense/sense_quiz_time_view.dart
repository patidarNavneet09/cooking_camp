import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:flutter/material.dart';

TextEditingController q1Controller = TextEditingController();
TextEditingController q2Controller = TextEditingController();
TextEditingController q3Controller = TextEditingController();
TextEditingController q4Controller = TextEditingController();
TextEditingController q5Controller = TextEditingController();

class SenseQuizTimeView extends StatefulWidget {
  const SenseQuizTimeView({super.key});

  @override
  State<SenseQuizTimeView> createState() => _SenseQuizTimeViewState();
}

class _SenseQuizTimeViewState extends State<SenseQuizTimeView> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Questions
          QuizQuestion(
            questionNumber: "1",
            questionText: "How many sense do we have?",
            controller: q1Controller,
          ),
          QuizQuestion(
            questionNumber: "2",
            questionText: "Which sense do we use our tongue for?",
            controller: q2Controller,
          ),
          QuizQuestion(
            questionNumber: "3",
            questionText: "Our sense of smell can warn us if there is a fire in the kitchen. True/False",
            controller: q3Controller,
          ),
          QuizQuestion(
            questionNumber: "4",
            questionText:
            "We should use all of our senses when we are in the kitchen. True/False",
            controller: q4Controller,
          ),
          QuizQuestion(
            questionNumber: "5",
            questionText:
            "Dark chocolate has a bitter flavour True/False",
            controller: q5Controller,
          ),

        ],

      );
  }
}
