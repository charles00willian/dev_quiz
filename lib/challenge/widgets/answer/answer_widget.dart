import 'package:dev_quiz/_core/core.dart';
import 'package:dev_quiz/_shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerWidget({
    Key? key,
    this.isSelected = false,
    required this.answer,
    required this.onTap,
  }) : super(key: key);

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            (BorderSide(
                color:
                    isSelected ? _selectedBorderCardRight : AppColors.border)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                answer.title,
                style:
                    isSelected ? _selectedTextStyleRight : AppTextStyles.body,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              child: isSelected
                  ? Icon(
                      _selectedIconRight,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorRight : AppColors.border,
                borderRadius: BorderRadius.circular(500),
                border: Border.fromBorderSide(
                  (BorderSide(
                    color: isSelected ? _selectedBorderRight : AppColors.border,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
