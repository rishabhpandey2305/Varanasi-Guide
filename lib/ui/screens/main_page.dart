import 'package:flutter/material.dart';
import 'package:varanasi_guide/models/guide_category.dart';
import 'package:varanasi_guide/services/json_loader.dart';
import 'package:varanasi_guide/theme/text_themes/text_theme.dart';
import 'package:varanasi_guide/ui/screens/guideList/ghat_list_page.dart';
import 'package:varanasi_guide/ui/widgets/card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<GuideCategory>> _categories;

  @override
  void initState() {
    super.initState();
    _categories = GuideCategoryJsonLoader.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guide", style: textTheme.titleLarge)),
      body: FutureBuilder<List<GuideCategory>>(
        future: _categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading categories"));
          } else {
            final categories = snapshot.data!;
            return SingleChildScrollView(
              child: Wrap(
                children:
                    categories.map((category) {
                      return CityCard(
                        title: category.title,
                        image: category.image,
                        onTap: () {
                          final routeName = '/${category.title.toLowerCase()}';

                          if (Navigator.canPop(context) ||
                              ModalRoute.of(context)?.settings.name !=
                                  routeName) {
                            Navigator.pushNamed(context, routeName);
                          }
                        },
                      );
                    }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
