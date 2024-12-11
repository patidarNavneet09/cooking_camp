import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/quiz_view.dart';
import 'package:flutter/material.dart';

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
          ),
          QuizQuestion(
            questionNumber: "2",
            questionText: "Where should handles of pots and pans point?",
          ),
          QuizQuestion(
            questionNumber: "3",
            questionText: "How should you carry a knife?",
          ),
          QuizQuestion(
            questionNumber: "4",
            questionText:
            "What should you keep kitchen electrical appliances away from?",
          ),
          QuizQuestion(
            questionNumber: "5",
            questionText:
            "What is the first thing Cooking Champs must do before they start cooking?",
          ),

        ],

      );
  }
}
