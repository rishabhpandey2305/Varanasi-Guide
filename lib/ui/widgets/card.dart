import 'package:flutter/material.dart';
import 'package:varanasi_guide/theme/colors/app_color.dart';
import 'package:varanasi_guide/theme/text_themes/text_theme.dart';

class CityCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const CityCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(0, 3),
                color: AppColor.black,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
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
                  Text(title, style: textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
