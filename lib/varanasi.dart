import 'package:flutter/material.dart';
import 'package:varanasi_guide/ui/home_page.dart';
import 'package:varanasi_guide/theme/app_theme.dart';

class Varanasi extends StatelessWidget {
  const Varanasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
