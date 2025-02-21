import 'package:flutter/material.dart';
import 'package:varanasi_guide/ui/theme/images/app_image.dart';
import 'package:varanasi_guide/ui/theme/text_themes/text_theme.dart';
import 'package:varanasi_guide/ui/widgets/buttons/next_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pagecontroller = PageController(
    initialPage: 0,
  );

  final List<String> _images = [AppImage.aarti, AppImage.boat, AppImage.sadhu];

  void _gotoNextPage() {
    if (_pagecontroller.page! < _images.length - 1) {
      _pagecontroller.nextPage(
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in _images) {
      precacheImage(NetworkImage(image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pagecontroller,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Image.network(
                _images[index],
                height: screenHeight,
                width: screenWidth,
                fit: BoxFit.cover,
              );
            },
          ),
          Text(
            "Hello world",
            style: textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextButton(
                  onNext: _gotoNextPage,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
