import 'package:dev_quiz/_core/app_colors.dart';
import 'package:dev_quiz/_shared/models/question_model.dart';
import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
  // uma foma de passar o estado
  // _ChallengePageState createState() =>
  //     _ChallengePageState(questions: questions);
}

class _ChallengePageState extends State<ChallengePage> {
  // final List<QuestionModel> questions;
  // _ChallengePageState({required this.questions});

  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    // controller.currentPageNotifier.addListener(() {
    //   setState(() {});
    // });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void goToNextPage() {
    if (!isLast(controller.currentPage))
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) {
      controller.score++;
    }
    goToNextPage();
  }

  bool isLast(int value) {
    return value == widget.questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: controller.currentPage,
                  totalPages: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelected: (value) async {
                  await Future.delayed(Duration(seconds: 1));
                  onSelected(value);
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: SafeArea(
          bottom: true,
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (!isLast(value))
                        Expanded(
                          child: NextButtonWidget.white(
                            label: "Pular",
                            borderColor: AppColors.border,
                            onTap: () {
                              goToNextPage();
                            },
                          ),
                        ),
                      if (isLast(value))
                        Expanded(
                          child: NextButtonWidget.green(
                            label: "Confirmar",
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    title: widget.title,
                                    length: widget.questions.length,
                                    score: controller.score,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  )),
        ),
      ),
    );
  }
}
