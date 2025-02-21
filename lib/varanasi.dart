import 'package:flutter/material.dart';
import 'package:varanasi_guide/core/constants/routes.dart';
import 'package:varanasi_guide/theme/app_theme.dart';

class Varanasi extends StatelessWidget {
  const Varanasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: '/',
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
