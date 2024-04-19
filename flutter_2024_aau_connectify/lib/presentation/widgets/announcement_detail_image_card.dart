import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/heights.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/widths.dart';

class AnnouncementDetailImageCard extends StatelessWidget {
  const AnnouncementDetailImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: CustomImageWidths.imagesLarge,
      height: CustomImageHeights.imagesMedium,
      child: Card(
        semanticContainer: true,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background_3.jpeg'))),
        ),
      ),
    );
  }
}
