import 'package:flutter/material.dart';
import 'package:varanasi_guide/models/ghat_model.dart';
import 'package:varanasi_guide/services/json_loader.dart';
import 'package:varanasi_guide/ui/widgets/card.dart';

class GhatListPage extends StatefulWidget {
  const GhatListPage({super.key});

  @override
  GhatListPageState createState() => GhatListPageState();
}

class GhatListPageState extends State<GhatListPage> {
  late Future<List<Ghat>> _ghats;

  @override
  void initState() {
    super.initState();
    _ghats = GhatJsonLoader.loadGhats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ghats of Varanasi")),
      body: FutureBuilder<List<Ghat>>(
        future: _ghats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          } else {
            final ghats = snapshot.data!;
            return SingleChildScrollView(
              child: Wrap(
                children:
                    ghats.map((category) {
                      return CityCard(
                        title: category.name,
                        image: category.image,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/placeDetails/${Uri.encodeComponent(category.name)}',
                          );
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
