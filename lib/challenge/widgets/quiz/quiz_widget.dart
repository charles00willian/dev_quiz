import 'package:dev_quiz/_core/core.dart';
import 'package:dev_quiz/_shared/models/answer_model.dart';
import 'package:dev_quiz/_shared/models/question_model.dart';
import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  const QuizWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: AnswerWidget(
                answer: answers(i),
                isSelected: indexSelected == i,
                onTap: () {
                  indexSelected = i;
                  setState(() {});
                },
              ),
            ),
        ],
      ),
    );
  }
}
