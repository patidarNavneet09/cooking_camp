import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:flutter/material.dart';

TextEditingController q1Controller = TextEditingController();
TextEditingController q2Controller = TextEditingController();
TextEditingController q3Controller = TextEditingController();
TextEditingController q4Controller = TextEditingController();
TextEditingController q5Controller = TextEditingController();

class SafetyQuizTimeView extends StatefulWidget {
  const SafetyQuizTimeView({super.key});

  @override
  State<SafetyQuizTimeView> createState() => _SafetyQuizTimeViewState();
}

class _SafetyQuizTimeViewState extends State<SafetyQuizTimeView> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Questions
          QuizQuestion(
            questionNumber: "1",
            questionText: "What should you never do in the kitchen?",
            controller: q1Controller,
          ),
          QuizQuestion(
            questionNumber: "2",
            questionText: "Where should handles of pots and pans point?",
            controller: q2Controller,
          ),
          QuizQuestion(
            questionNumber: "3",
            questionText: "How should you carry a knife?",
            controller: q3Controller,
          ),
          QuizQuestion(
            questionNumber: "4",
            questionText:
            "What should you keep kitchen electrical appliances away from?",
            controller: q4Controller,
          ),
          QuizQuestion(
            questionNumber: "5",
            questionText:
            "What is the first thing Cooking Champs must do before they start cooking?",
            controller: q5Controller,
          ),

        ],

      );
  }
}