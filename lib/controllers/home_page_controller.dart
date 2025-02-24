import 'package:flutter/widgets.dart';
import 'package:varanasi_guide/core/constants/app_constants.dart';
import 'package:varanasi_guide/core/utils/image_helper.dart';

class HomePageController {
  late PageController pageController;
  HomePageController() {
    pageController = PageController();
  }

  void goToNextPage() {
    if (pageController.hasClients && pageController.page != null) {
      if (pageController.page! < AppConstants.images.length - 1) {
        pageController.nextPage(
          duration: Duration(milliseconds: 1),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void precacheImages(BuildContext context) {
    ImageHelper.precacheImages(context, AppConstants.images);
  }

  void dispose() {
    pageController.dispose();
  }

  bool isLastPage() {
    return (pageController.hasClients && pageController.page != null)
        ? pageController.page!.round() == AppConstants.images.length - 1
        : false;
  }
}
