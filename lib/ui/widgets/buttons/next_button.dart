import 'package:flutter/material.dart';
import 'package:varanasi_guide/theme/colors/app_color.dart';
import 'package:varanasi_guide/theme/icons/app_icon.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onNext;
  const NextButton({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onNext,
      backgroundColor: AppColor.buttonBackgroundColor,
      child: AppIcon.arrowForward,
    );
  }
}
