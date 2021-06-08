import 'package:dev_quiz/_core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color? borderColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    this.borderColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({
    required String label,
    this.borderColor,
    required this.onTap,
  })  : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label;

  NextButtonWidget.transparent({
    required String label,
    this.borderColor,
    required this.onTap,
  })  : this.backgroundColor = Colors.transparent,
        this.fontColor = AppColors.grey,
        this.label = label;

  NextButtonWidget.white({
    required String label,
    this.borderColor,
    required this.onTap,
  })  : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label;

  NextButtonWidget.purple({
    required String label,
    this.borderColor,
    required this.onTap,
  })  : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(this.backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: this.borderColor != null
              ? MaterialStateProperty.all(
                  BorderSide(
                    color: this.borderColor!,
                  ),
                )
              : null,
        ),
        onPressed: this.onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: this.fontColor,
          ),
        ),
      ),
    );
  }
}
