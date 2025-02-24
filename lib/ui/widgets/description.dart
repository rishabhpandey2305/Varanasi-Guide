import 'package:flutter/material.dart';
import 'package:varanasi_guide/theme/colors/app_color.dart';
import 'package:varanasi_guide/theme/text_themes/text_theme.dart';

class Description extends StatelessWidget {
  final String description;
  final String image;
  final String name;
  const Description({
    super.key,
    required this.description,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Text(name, style: textTheme.bodyMedium),
            ],
          ),
          SizedBox(height: 20),
          Text(description, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}
