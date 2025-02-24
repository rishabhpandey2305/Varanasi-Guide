import 'package:flutter/material.dart';
import 'package:varanasi_guide/theme/colors/app_color.dart';

TextStyle titleTextStyle = TextStyle(
  fontFamily: "workSansRegular",
  color: AppColor.black,
);
TextStyle labelTextStyle = TextStyle(
  fontFamily: "workSansRegular",
  color: AppColor.white,
);
TextStyle bodyTextStyle = TextStyle(
  fontFamily: "workSansRegular",
  color: AppColor.black,
);

final titleLarge = titleTextStyle.copyWith(fontSize: 25);
final labelMedium = labelTextStyle.copyWith(fontSize: 25);
final bodySmall = bodyTextStyle.copyWith(fontSize: 16);

var textTheme = TextTheme(
  titleLarge: titleLarge,
  bodyMedium: labelMedium,
  bodySmall: bodySmall,
);
