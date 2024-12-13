import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:flutter/material.dart';

TextEditingController q1BasicController = TextEditingController();
TextEditingController q2BasicController = TextEditingController();
TextEditingController q3BasicController = TextEditingController();
TextEditingController q4BasicController = TextEditingController();
TextEditingController q5BasicController = TextEditingController();
class BasicQuizTimeView extends StatefulWidget {
  const BasicQuizTimeView({super.key});

  @override
  State<BasicQuizTimeView> createState() => _BasicQuizTimeViewState();
}

class _BasicQuizTimeViewState extends State<BasicQuizTimeView> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Questions
          QuizQuestion(
            questionNumber: "1",
            questionText: "What do we use Tongs for?",
            controller: q1BasicController, maxLine:2,
          ),
          QuizQuestion(
            questionNumber: "2",
            questionText: "Which tool do we use to beat eggs?",
            controller: q2BasicController,
          ),

          QuizQuestion(
            questionNumber: "3",
            questionText: "What do we use to measure ingredients with?",
            controller: q3BasicController,
          ),

          QuizQuestion(
            questionNumber: "4",
            questionText: "What do we use to weigh our ingredients?",
            controller: q4BasicController,
          ),
          QuizQuestion(
            questionNumber: "5",
            questionText: "How many grams in a kilogram?",
            controller: q5BasicController,
          ),

        ],

      );
  }
}
