import 'package:flutter/widgets.dart';
import 'package:varanasi_guide/core/constants/app_constants.dart';
import 'package:varanasi_guide/core/utils/image_helper.dart';

class HomePageController {
  final PageController pageController = PageController(initialPage: 0);
  void goToNextPage() {
    if (pageController.page! < AppConstants.images.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void precacheImages(BuildContext context) {
    ImageHelper.precacheImages(context, AppConstants.images);
  }

  void dispose() {
    pageController.dispose();
  }
}
