import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/heights.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/widths.dart';

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String images;
  final DateTime date;
  final String summary;
  const AnnouncementCard(
      {super.key,
      required this.title,
      required this.images,
      required this.date,
      required this.summary});

  @override
  Widget build(BuildContext context) {
    return Card(
        // design best announcment card
        margin: const EdgeInsets.all(CustomPaddings.small),
        child: Column(children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Image.asset(
            images,
            height: CustomImageHeights.imagesSmall,
            width: CustomImageWidths.imagesSmall,
          ),
          //
          Text(
            date.toString().substring(0, 11),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
          Text(summary, style: Theme.of(context).textTheme.bodyMedium),
          Container(
              margin: const EdgeInsets.all(CustomPaddings.small),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, announcementDetailUserRoute);
                  },
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        minimumSize: const MaterialStatePropertyAll(
                            Size(double.infinity, ButtonHeights.large)),
                      ),
                  child: const Text('Read More'))),
        ]));
  }
}
