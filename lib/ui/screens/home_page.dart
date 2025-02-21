import 'package:flutter/material.dart';
import 'package:varanasi_guide/controllers/home_page_controller.dart';
import 'package:varanasi_guide/ui/widgets/buttons/next_button.dart';
import 'package:varanasi_guide/ui/widgets/image_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _controller = HomePageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.precacheImages(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToMainPage() {
    Navigator.pushReplacementNamed(context, '/mainPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ImageSlider(pageController: _controller.pageController),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextButton(
                  onNext: () {
                    if (_controller.isLastPage()) {
                      _navigateToMainPage();
                    } else {
                      _controller.goToNextPage();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
