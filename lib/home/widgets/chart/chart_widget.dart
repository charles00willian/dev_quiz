import 'package:dev_quiz/_core/app_colors.dart';
import 'package:dev_quiz/_core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final int score;

  const ChartWidget({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score / 100,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              child: Text(
                "${score}%",
                style: AppTextStyles.heading,
              ),
            )
          ],
        ));
  }
}
