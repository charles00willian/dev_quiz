import 'package:dev_quiz/_core/core.dart';
import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente",
              isRight: false,
              isSelected: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente",
              isRight: false,
              isSelected: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente",
              isRight: false,
              isSelected: true,
            ),
          ),
        ],
      ),
    );
  }
}
