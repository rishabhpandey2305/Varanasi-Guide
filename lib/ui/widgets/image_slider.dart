import 'package:flutter/material.dart';
import 'package:varanasi_guide/core/constants/app_constants.dart';

class ImageSlider extends StatelessWidget {
  final PageController pageController;
  const ImageSlider({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) {
        return Image.network(
          AppConstants.images[index],
          height: screenHeight,
          width: screenWidth,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
