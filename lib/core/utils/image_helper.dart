import 'package:flutter/widgets.dart';
import 'package:varanasi_guide/core/constants/app_constants.dart';

class ImageHelper {
  static void precacheImages(BuildContext context, List<String> images) {
    for (var image in AppConstants.images) {
      precacheImage(NetworkImage(image), context);
    }
  }
}
