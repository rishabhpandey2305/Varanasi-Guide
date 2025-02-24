import 'package:flutter/material.dart';
import 'package:varanasi_guide/models/ghat_model.dart';
import 'package:varanasi_guide/services/json_loader.dart';
import 'package:varanasi_guide/ui/widgets/description.dart';

class PlaceDetails extends StatefulWidget {
  final String ghatName;

  const PlaceDetails({super.key, required this.ghatName});

  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetails> {
  late Future<List<Ghat>> _ghats;

  @override
  void initState() {
    super.initState();
    _ghats = GhatJsonLoader.loadGhats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.ghatName)),
      body: FutureBuilder<List<Ghat>>(
        future: _ghats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          } else {
            final ghats = snapshot.data!;
            final ghat = ghats.firstWhere(
              (g) => g.name.toLowerCase() == widget.ghatName.toLowerCase(),
            );
            debugPrint(
              "Selected Ghat: ${ghat.name}, Image: ${ghat.image}, Description: ${ghat.description}",
            );
            return SingleChildScrollView(
              child: Description(
                name: widget.ghatName,
                image: ghat.image,
                description: ghat.description,
              ),
            );
          }
        },
      ),
    );
  }
}
