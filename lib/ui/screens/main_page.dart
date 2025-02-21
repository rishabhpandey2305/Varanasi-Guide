import 'package:flutter/material.dart';
import 'package:varanasi_guide/theme/text_themes/text_theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Hello World", style: textTheme.titleLarge)));
  }
}
