import 'package:flutter/material.dart';
import 'package:varanasi_guide/ui/screens/home_page.dart';
import 'package:varanasi_guide/ui/screens/main_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const HomePage(),
      '/mainPage': (context) => const MainPage(),
    };
    ;
  }
}
