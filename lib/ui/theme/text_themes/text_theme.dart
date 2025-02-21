import 'package:flutter/material.dart';
import 'package:varanasi_guide/ui/theme/colors/app_color.dart';

TextStyle baseTextStyle =
    TextStyle(fontFamily: "workSansRegular", color: AppColor.black);

final titleLarge = baseTextStyle.copyWith(
  fontSize: 40,
);

var textTheme = TextTheme(titleLarge: titleLarge);
